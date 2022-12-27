import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:fitbasix_submission/model/water_consumed/water_consumed.dart';
import 'package:fitbasix_submission/notifier/water_consumed_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

class CalorieBurnedPage extends ConsumerStatefulWidget {
  const CalorieBurnedPage({Key? key}) : super(key: key);

  @override
  ConsumerState<CalorieBurnedPage> createState() => _CalorieBurnedPageState();
}

class _CalorieBurnedPageState extends ConsumerState<CalorieBurnedPage> {
  int limit = 0;
  late List<_ChartData> chartLineData;
  late List<_ChartData> semiCircleData;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    Future.microtask(() async{
      await Permission.activityRecognition.request();
      requestWaterConsumedState();
    });

    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  Future requestWaterConsumedState() async {
    await ref
        .read(waterConsumedListNotifier.notifier)
        .requestWaterConsumedListData();
  }

  @override
  Widget build(BuildContext context) {
    final waterConsumedState = ref.watch(waterConsumedListNotifier);
    return waterConsumedState.when(
      data: (listData) {
        print(listData.map((e) => e.quantity).toList());
        print(listData.map((e) => e.dateTime).toList());
        chartLineData = List.generate(7, (index) {
          String weekDay = DateFormat('EEEE')
              .format(listData[13 - index - limit].dateTime)
              .substring(0, 3);
          double yData = listData[13 - index - limit].quantity;
          return _ChartData(weekDay, yData);
        }).reversed.toList();
        print(chartLineData.map((e) => e.y).toList());
        print(chartLineData.map((e) => e.x).toList());
        semiCircleData = List.generate(2, (index) {
          double y;
          if (index == 0) {
            y = listData[13].quantity / 4.5;
          } else {
            y = (4.5 - listData[13].quantity) / 4.5;
          }
          return _ChartData('', y);
        });
        final ValueNotifier<double> valueNotifier = ValueNotifier<double>(0);
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 2,
              child: Container(
                clipBehavior: Clip.hardEdge,
                padding: EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 15,
                ),
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.yellow),
                  color: Colors.yellow.withOpacity(0.5),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      width: (MediaQuery.of(context).size.width - 60),
                      child: SfCircularChart(
                          tooltipBehavior: _tooltip,
                          series: <DoughnutSeries<_ChartData, String>>[
                            DoughnutSeries<_ChartData, String>(
                              strokeColor: Colors.orange,
                              radius: '100',
                              innerRadius: '85',
                              startAngle: 270,
                              endAngle: 90,
                              dataSource: semiCircleData,
                              xValueMapper: (_ChartData data, _) => data.x,
                              yValueMapper: (_ChartData data, _) => data.y,
                            ),
                          ]),
                    ),
                    Positioned(
                      top: 0,
                      height: 20,
                      width: 20,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.grey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                            ),
                            context: context,
                            builder: (ctx) {
                              return Container(
                                color: Colors.grey[800],
                                padding: EdgeInsets.all(20),
                                child: (listData[13].quantity == 4.5)
                                    ? Text(
                                    "You have consumed your daily target")
                                    : ValueListenableBuilder(
                                  valueListenable: valueNotifier,
                                  builder: (context, value, _) {
                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                      children: [
                                        Text(
                                          'I consumed ${valueNotifier.value.toStringAsPrecision(2)} l of water now',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Slider(
                                          min: 0.0,
                                          max: 4.5 - listData[13].quantity,
                                          divisions: (10 *
                                              (4.5 -
                                                  listData[13].quantity))
                                              .toInt(),
                                          label: valueNotifier.value
                                              .toStringAsPrecision(2),
                                          value: valueNotifier.value,
                                          onChanged: (value) {
                                            valueNotifier.value = value;
                                          },
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          'Total consumed today ${(listData[13].quantity + valueNotifier.value).toStringAsPrecision(2)} l of 4.5 l',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        ElevatedButton(
                                          onPressed: () async {
                                            showDialog(
                                              barrierDismissible: false,
                                              context: context,
                                              builder: (context) {
                                                return Center(
                                                  child:
                                                  CircularProgressIndicator(),
                                                );
                                              },
                                            );
                                            DateTime dateTime =
                                            DateTime.now();
                                            DateTime date = DateTime(
                                                dateTime.year,
                                                dateTime.month,
                                                dateTime.day);
                                            WaterConsumed waterConsumed =
                                            WaterConsumed(
                                              quantity:
                                              listData[13].quantity +
                                                  valueNotifier.value,
                                              dateTime: date,
                                            );
                                            await ref
                                                .read(
                                                waterConsumedListNotifier
                                                    .notifier)
                                                .setWaterConsumedData(
                                                waterConsumed);
                                            context.router.pop();
                                          },
                                          child: Text('Submit'),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              );
                            },
                          );
                        },
                        child: Icon(
                          Icons.monitor_heart,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      height: 20,
                      width: (MediaQuery.of(context).size.width - 60)/2,
                      left: 0,
                      child: Text(
                        'Calories Burnt',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Positioned(
                      left: (MediaQuery.of(context).size.width - 60) / 4,
                      width: (MediaQuery.of(context).size.width - 60) / 2,
                      height: 100,
                      bottom: 0,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            (listData[13].quantity).toStringAsPrecision(2),
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          //listData[0].quantity/4.5),
                          Text('Kcal'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (limit < 6) {
                        limit++;
                      }
                    });
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (limit > 0) {
                        limit--;
                      }
                    });
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                  ),
                ),
              ],
            ),
            SfCartesianChart(
                primaryXAxis:
                CategoryAxis(rangePadding: ChartRangePadding.none),
                primaryYAxis: NumericAxis(
                  minimum: 0,
                  maximum: 5,
                  interval: 0.5,
                  isVisible: false,
                ),
                tooltipBehavior: _tooltip,
                series: <ChartSeries<_ChartData, String>>[
                  AreaSeries<_ChartData, String>(
                    dataSource: chartLineData,
                    xValueMapper: (_ChartData data, _) => data.x,
                    yValueMapper: (_ChartData data, _) => data.y,
                    name: 'Gold',
                    color: Colors.blue,
                    gradient: LinearGradient(
                      colors: [Colors.yellow, Colors.black87],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ]),
          ],
        );
      },
      error: (e, _) {
        return Center(
          child: Text(
            'Error',
          ),
        );
      },
      loading: () {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}

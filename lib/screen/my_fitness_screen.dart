import 'package:fitbasix_submission/my_app.dart';
import 'package:fitbasix_submission/widgets/option_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/data_tile.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/my_fitness_app_bar.dart';

class MyFitnessScreen extends ConsumerStatefulWidget {
  const MyFitnessScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<MyFitnessScreen> createState() => _MyFitnessScreenState();
}

class _MyFitnessScreenState extends ConsumerState<MyFitnessScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('My Fitness'),
        ),
        body: SingleChildScrollView(
          primary: true,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      foregroundImage: NetworkImage(
                        'https://media.istockphoto.com/id/1270987867/photo/close-up-young-smiling-man-in-casual-clothes-posing-isolated-on-blue-wall-background-studio.jpg?s=612x612&w=0&k=20&c=FXkui3WMnV8YY_aqt8VsSSXYznvm9Y3eMoHMYyW4za4=',
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      'Hi Brandon Wong',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  clipBehavior: Clip.hardEdge,
                  padding: EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 20,
                  ),
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Color(0xFF222222),
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Today's requirements"),
                          Text(
                            "2173 kcal",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFF343226),
                                ),
                                child: Icon(
                                  Icons.foggy,
                                  size: 30,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Carbs',
                                style: TextStyle(fontSize: 15),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              RichText(
                                text: TextSpan(
                                    text: '217 g ',
                                    style: TextStyle(fontSize: 15),
                                    children: [
                                      TextSpan(
                                        text: '869 kcal',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ]),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFF343226),
                                ),
                                child: Icon(
                                  Icons.foggy,
                                  size: 30,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Carbs',
                                style: TextStyle(fontSize: 15),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              RichText(
                                text: TextSpan(
                                    text: '217 g ',
                                    style: TextStyle(fontSize: 15),
                                    children: [
                                      TextSpan(
                                        text: '869 kcal',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ]),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xFF343226),
                                ),
                                child: Icon(
                                  Icons.foggy,
                                  size: 30,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Carbs',
                                style: TextStyle(fontSize: 15),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              RichText(
                                text: TextSpan(
                                    text: '217 g ',
                                    style: TextStyle(fontSize: 15),
                                    children: [
                                      TextSpan(
                                        text: '869 kcal',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ]),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )),
              OptionPageView(),
            ],
          ),
        ),
      ),
    );
  }
}

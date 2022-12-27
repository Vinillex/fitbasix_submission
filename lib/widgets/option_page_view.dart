import 'package:fitbasix_submission/widgets/calorie_burned_page.dart';
import 'package:fitbasix_submission/widgets/water_consumed_page.dart';
import 'package:flutter/material.dart';

class OptionPageView extends StatefulWidget {
  const OptionPageView({Key? key}) : super(key: key);

  @override
  State<OptionPageView> createState() => _OptionPageViewState();
}

class _OptionPageViewState extends State<OptionPageView> {
  int pageNumber = 0;
  final PageController _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  _controller.animateToPage(
                    0,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.linear,
                  );
                  setState(() {
                    pageNumber = 0;
                  });
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      (pageNumber == 0) ? Colors.green : Colors.grey,
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            20,
                          ),
                        ),
                      ),
                    )),
                child: Text(
                  'Water Consumed',
                ),
              ),
              SizedBox(
                width: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  _controller.animateToPage(
                    1,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.linear,
                  );
                  setState(() {
                    pageNumber = 1;
                  });
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      (pageNumber == 1) ? Colors.green : Colors.grey,
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            20,
                          ),
                        ),
                      ),
                    )),
                child: Text(
                  'Calories Burned',
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 1000,
          child: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: _controller,
            pageSnapping: true,
            children: [
              WaterConsumedPage(),
              CalorieBurnedPage(),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class MyFitnessAppBarWidget extends StatelessWidget {
  const MyFitnessAppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      floating: true,
      pinned: false,
      delegate: _HomeAppbarDelegate(
        minHeight: 160,
        maxHeight: 160,
      ),
    );
  }
}

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        context.router.pop();
                      },
                      icon: Icon(Icons.arrow_back_ios),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      'My Fitness',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),

              ],
            ),
          ),
          Divider(
            color: Colors.grey[800],
            thickness: 0.2,
            height: 0,
          ),
        ],
      ),
    );
  }
}

class _HomeAppbarDelegate extends SliverPersistentHeaderDelegate {
  _HomeAppbarDelegate({
    required this.minHeight,
    required this.maxHeight,
  });

  final double minHeight;
  final double maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: HomeAppBar(),
    );
  }

  @override
  bool shouldRebuild(_HomeAppbarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight;
  }
}

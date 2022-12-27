import 'package:flutter/material.dart';
import 'dart:math' as math;

class HomeAppBarWidget extends StatelessWidget {
  const HomeAppBarWidget({Key? key}) : super(key: key);

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
                    Expanded(
                      child: FlutterLogo(),
                    ),
                    Expanded(
                      flex: 2,
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(0),
                          hintText: 'Search',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          fillColor: Colors.grey[800],
                          filled: true,
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
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

import 'package:auto_route/auto_route.dart';
import 'package:fitbasix_submission/router/app_router.gr.dart';
import 'package:flutter/material.dart';

import '../utility/app_constants.dart';
import '../utility/constants.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      backgroundColor: bgColor,
      key: AppConstants.drawerScaffoldKey,
      routes: [
        HomeRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: elevation2,
          currentIndex: tabsRouter.activeIndex,
          selectedItemColor: primaryColor,
          unselectedItemColor: tinyTextColor,
          selectedFontSize: 12,
          unselectedFontSize: 10,
          iconSize: 20,
          onTap: (i) {},
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(
                Icons.restaurant_menu,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Orders',
              icon: Icon(
                Icons.menu_book,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Cart',
              icon: Icon(
                Icons.shopping_cart,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Profile',
              icon: Icon(
                Icons.person,
              ),
            ),
          ],
        );
      },
    );
  }
}

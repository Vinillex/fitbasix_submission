import 'package:auto_route/auto_route.dart';
import 'package:fitbasix_submission/router/page_route_builder.dart';
import 'package:fitbasix_submission/screen/my_fitness_screen.dart';

import '../screen/dashboard_screen.dart';
import '../screen/home_screen.dart';

// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
@CustomAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    CustomRoute(
      initial: true,
      path: 'dashboard',
      page: DashboardScreen,
      children: [
        CustomRoute(page: HomeScreen),
      ],
    ),
    CustomRoute(
      customRouteBuilder: myCustomRouteBuilder,
      path: 'myFitness',
      page: MyFitnessScreen,
    ),
    RedirectRoute(path: '*', redirectTo: ''),
  ],
)
class $AppRouter {}

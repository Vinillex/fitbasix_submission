import 'package:fitbasix_submission/router/app_router.gr.dart';
import 'package:fitbasix_submission/utility/app_constants.dart';
import 'package:fitbasix_submission/utility/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';


class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  static MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<MyAppState>()!;

  @override
  ConsumerState<MyApp> createState() => MyAppState();
}

class MyAppState extends ConsumerState<MyApp> {
  late AppRouter appRouter;

  @override
  void initState() {
    appRouter = AppRouter();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      scaffoldMessengerKey: AppConstants.scaffoldKey,
      routerDelegate: appRouter.delegate(
        navigatorObservers: () => [],
      ),
      routeInformationParser: appRouter.defaultRouteParser(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: secondaryDarkColor,
        ),
      ),
    );
  }
}

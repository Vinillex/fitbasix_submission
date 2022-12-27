import 'package:firebase_core/firebase_core.dart';
import 'package:fitbasix_submission/utility/get_its.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'my_app.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);


  await Firebase.initializeApp();
  registerDependencies();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}
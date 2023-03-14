import 'dart:async';

import 'package:di_mixin_extension_demo/screens/home_screen.dart';
import 'package:flutter/material.dart';

import 'di/app_module.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppModule().initialise(); // Setup Service Locator

  runZonedGuarded(() {
    runApp(
      const HomePage(title: 'DI demo'),
    );
  }, (Object error, StackTrace stack) {
    debugPrint(error.toString());
  });
}

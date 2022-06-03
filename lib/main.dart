import 'package:com_unrealprogrammer_orderingo/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:com_unrealprogrammer_orderingo/helpers/app_constants.dart'
    as constants;
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'helpers/app_theme.dart';
import 'pages/splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  constants.connectionStatus.initialize();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: constants.primaryColor));

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late AppTheme _appTheme;
  @override
  void initState() {
    super.initState();
    _appTheme = AppTheme();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: _appTheme.getAppLightTheme(),
      debugShowCheckedModeBanner: false,
      initialRoute: "/Splash",
      getPages: [
        GetPage(
            name: "/Splash",
            page: () {
              return const SplashScreen();
            }),
        GetPage(
            name: "/home",
            page: () {
              return const HomePage();
            }),
      ],
    );
  }
}

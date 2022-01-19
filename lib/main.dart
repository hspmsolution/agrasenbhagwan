import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'webview_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarBrightness: Brightness.light) // Or Brightness.dark
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Agrasen Bhagwan',
      theme: ThemeData.light(),//ThemeData(
      //primarySwatch: Colors.blue,
      //brightness: Brightness.dark,
      //),
      themeMode: ThemeMode.light,

      home: AnimatedSplashScreen(
        splash: Image.asset('lib/assets/images/logo.png'),
        backgroundColor: Colors.black,
        splashIconSize: 300,
        splashTransition: SplashTransition.fadeTransition,
        duration: 1000,
        nextScreen: const WebViewScreen(),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:viva_practical/Utils/route_utils.dart';
import 'package:viva_practical/views/screen/Home_Page.dart';
import 'package:viva_practical/views/screen/PDF_screen.dart';
import 'package:viva_practical/views/screen/Splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: MyRoutes.splashScreen,
      routes: {
        MyRoutes.HomePage: (context) => const HomePage(),
        MyRoutes.splashScreen: (context) => const SplashScreen(),
        MyRoutes.PDF: (context) => const PDF(),
      },
    );
  }
}

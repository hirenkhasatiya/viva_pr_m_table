import 'dart:async';
import 'package:flutter/material.dart';

import '../../Utils/route_utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  ChangePage() {
    Timer.periodic(
      Duration(seconds: 4),
      (timer) {
        Navigator.of(context).pushReplacementNamed(MyRoutes.HomePage);
        timer.cancel();
      },
    );
  }

  @override
  void initState() {
    super.initState();
    ChangePage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(
                flex: 4,
              ),
              Image.asset(
                "asset/Images/Mathematics.png",
              ),
              const Spacer(),
              CircularProgressIndicator(),
              const Spacer(
                flex: 3,
              )
            ],
          )),
      backgroundColor: Colors.white,
    );
  }
}

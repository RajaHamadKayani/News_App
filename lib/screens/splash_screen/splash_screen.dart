import 'dart:async';

import "package:flutter/material.dart";
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:news_app/utisl/Routes/route_names.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void navToHome(BuildContext context) {
    Timer(const Duration(seconds: 4), () async {
      Navigator.pushNamed(context, RouteNames.homeScreen);
    });
  }

  @override
  void initState() {
    super.initState();
    navToHome(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
                text: const TextSpan(children: [
              TextSpan(
                  text: "News App",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue)),
              TextSpan(
                  text: " 4U",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff000000)))
            ])),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            SpinKitChasingDots(
              size: 40,
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/core/page._route_names.dart';
import 'package:news_app/core/settings_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, PageRouteNames.layout);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);

    return Container(
      decoration: const BoxDecoration(
          image:
              DecorationImage(image: AssetImage("assets/images/pattern.png"))),
      child: const Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(
            flex: 2,
          ),
          Center(child: Image(image: AssetImage("assets/images/logo.png"))),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(bottom: 40),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image(
                  image: AssetImage(
                    "assets/images/route blue.png",
                  ),
                  width: 140,
                  height: 128,
                  fit: BoxFit.cover,
                ),
                Text(
                  "supervised by Mohamed Nabil",
                  style: TextStyle(
                      color: Color(0xff39A552),
                      fontSize: 18,
                      fontFamily: "Poppins"),
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}

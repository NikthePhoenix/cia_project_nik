import 'package:flutter/material.dart';
import 'package:seproject/hive/hive.dart';
import 'other/routes.dart';
import 'package:hive/hive.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final myBox = HiveManager.myBox;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      if (myBox.get('agreement') == null) {
        Navigator.pushReplacementNamed(context, Routes.agreement);
      } else {
        Navigator.pushReplacementNamed(context, Routes.signUp);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: Center(
            child: Image.asset(
          "assets/images/splash_screen_img.png",
          height: MediaQuery.of(context).size.height * .4,
        )));
  }
}

import 'package:flutter/material.dart';
import 'other/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, Routes.agreement);
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

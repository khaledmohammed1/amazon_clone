import 'package:amazon_clone/views/auth_screen/auth_screen.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';

import '../home_screen/home_screen.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset("assets/images/amazonlogo.jpg"),
      backgroundColor: Colors.white,
      showLoader: false,
      navigator: const AuthScreen(),
      durationInSeconds: 3,
    );
  }
}
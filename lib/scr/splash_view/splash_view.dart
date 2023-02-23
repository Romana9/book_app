// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:bookly/constans.dart';
import 'package:bookly/scr/home/views/home.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  navigateToHome() {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Home()));
    });
  }

  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(AssetData.logo),
          SizedBox(
            height: 4,
          ),
          Text(
            "Read Free Books",
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}

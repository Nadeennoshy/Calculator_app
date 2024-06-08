import 'dart:async';

import 'package:calculator_app/constants.dart';
import 'package:calculator_app/views/home_view.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState(){
    super.initState();
    navigateToHomeView();
  }
  void navigateToHomeView(){
    Timer(const Duration(seconds: 5),(){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context)=>HomeView())
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/splash.gif'),
          const Text('Calculate EveryThing',
          style: TextStyle(
            color: kSecondaryColor,
            fontSize: 32,
            fontWeight: FontWeight.bold,
            
          ),
          ),
          const Text('Perform all calculations including',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
          ),
          const Text('currency conversions & a lot more',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
          ),
        ],
      ),
    );
  }
}
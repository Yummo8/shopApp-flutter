// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shopping_app/Screens/HomePage/HomePage.dart';

class LoginSuccess extends StatefulWidget {
  const LoginSuccess({Key key}) : super(key: key);

  @override
  State<LoginSuccess> createState() => _LoginSuccessState();
}

class _LoginSuccessState extends State<LoginSuccess> {

  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
            () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage())));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Colors.white,
      body: Center(
        child: Lottie.asset('assets/Images/thankyou.json'),
      ),
    );
  }
}

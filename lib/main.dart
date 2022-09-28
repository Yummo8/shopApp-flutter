// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages, camel_case_types, avoid_print, unrelated_type_equality_checks

import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping_app/Screens/HomePage/HomePage.dart';
import 'package:shopping_app/Screens/SplashScreen/SplashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString('user_name');
  if (Platform.isAndroid) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAL2xhBXGKprjSmDfmflGxRyLIUEmFYh5Y",
            appId: "1:969801338697:android:1ab3007f68f94aef479498",
            messagingSenderId: "969801338697",
            projectId: "e-commerce-app-bc2dd"));
  } else {
    Firebase.initializeApp();
  }
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: email == null ? SplashScreen() : HomePage(),
  ));
}

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  importance: Importance.high,
);
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

//\u{20B9}

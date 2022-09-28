// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables, duplicate_ignore

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Notificationsss extends StatefulWidget {
  const Notificationsss({Key key}) : super(key: key);

  @override
  State<Notificationsss> createState() => _NotificationsssState();
}

class _NotificationsssState extends State<Notificationsss> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Notification",
            style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            SizedBox(height: 20),
            Text("Local Notification",
                style: TextStyle(
                    letterSpacing: 3,
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 30),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [BoxShadow(color: Colors.black, blurRadius: 2)]),
              child: ListTile(
                leading: Icon(Icons.notifications, color: Colors.black),
                title: Text("Simple Notification",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
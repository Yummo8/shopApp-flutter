// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class MyRewards extends StatefulWidget {
  const MyRewards({Key key}) : super(key: key);

  @override
  State<MyRewards> createState() => _MyRewardsState();
}

class _MyRewardsState extends State<MyRewards> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("My Rewards",
            style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold)),
      ),
      // body: Padding(
      //   padding: EdgeInsets.all(10),
      //   child: ListView(
      //     children: [
      //       Image.network(
      //           "https://img.freepik.com/free-vector/loyalty-program-concept_74855-6543.jpg?w=1380&t=st=1660640244~exp=1660640844~hmac=ad763409f153d580fc496523240d0e68f6b67b615c94cb18e354c6fb65e8845d",
      //           fit: BoxFit.cover),
      //       SizedBox(height: 10),
      //       Image.network(
      //           "https://img.freepik.com/free-vector/man-paying-online-receiving-cashback-wallet_88138-692.jpg?w=1060&t=st=1660640370~exp=1660640970~hmac=2eeab0a3faea7cd34a5ad92d6dfdb51f29145d8c6c3e9c88f6aca372759dcee6",
      //           fit: BoxFit.cover),
      //       SizedBox(height: 10),
      //       Image.network(
      //           "https://img.freepik.com/free-vector/cashback-concept_23-2148453343.jpg?w=740&t=st=1660640402~exp=1660641002~hmac=e834a1244ebdd1add6ef763f9d31a123f32e5ed6c41f8e1c4972bcf858bdcfa4",
      //           fit: BoxFit.cover),
      //       SizedBox(height: 10),
      //       Image.network(
      //           "https://img.freepik.com/premium-vector/grand-prize-anniversary-horizontal-banner-template-with-editable-text-effect_439673-61.jpg?w=1060",
      //           fit: BoxFit.cover),
      //       SizedBox(height: 10),
      //       Image.network(
      //           "https://img.freepik.com/premium-vector/giveaway-banner-template-design-social-media-post_7087-891.jpg?w=740",
      //           fit: BoxFit.cover),
      //     ],
      //   ),
      // ),
    );
  }
}

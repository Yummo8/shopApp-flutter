// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class MyOrder extends StatefulWidget {
  const MyOrder({Key key}) : super(key: key);

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   iconTheme: IconThemeData(color: Colors.black),
        //   backgroundColor: Colors.white,
        //   centerTitle: true,
        //   title: Text("My Order",
        //       style: TextStyle(
        //           color: Colors.black,
        //           fontSize: 25,
        //           fontWeight: FontWeight.bold)),
        // ),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                shadowColor: Colors.black,
                iconTheme: IconThemeData(color: Colors.black),
                backgroundColor: Colors.white,
                title: Text("My Order",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold)),
                pinned: true,
                floating: true,
                bottom: TabBar(
                  unselectedLabelColor: Colors.red,
                  indicatorPadding: EdgeInsets.all(5),
                  indicator: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black12,
                  ),
                  labelColor: Colors.black,
                  labelStyle:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  tabs: [
                    Tab(
                      text: 'Recent',
                    ),
                    Tab(
                      text: 'Cancelled',
                    ),
                    Tab(
                      text: 'Completed',
                    ),
                  ],
                ),
              )
            ];
          },
          body: TabBarView(children: [
            Center(
                child: Text("Recent",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30))),
            Center(
                child: Text("Cancelled",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30))),
            Center(
                child: Text("Completed",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30))),
          ]),
        ),
      ),
    );
  }
}

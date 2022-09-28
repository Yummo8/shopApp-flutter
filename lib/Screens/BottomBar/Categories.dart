// ignore_for_file: prefer_const_constructors, avoid_init_to_null, sort_child_properties_last, prefer_const_literals_to_create_immutables, prefer_final_fields, file_names

import 'package:flutter/material.dart';
import 'package:shopping_app/Screens/Catgories/Beauty%20and%20Wellness.dart';
import 'package:shopping_app/Screens/Catgories/Electronics.dart';
import 'package:shopping_app/Screens/Catgories/Kitchen.dart';
import 'package:shopping_app/Screens/Catgories/Laggage.dart';
import 'package:shopping_app/Screens/Catgories/Men/Accessories.dart';
import 'package:shopping_app/Screens/Catgories/Men/Clothes.dart';
import 'package:shopping_app/Screens/Catgories/Men/Shoes.dart';
import 'package:shopping_app/Screens/Catgories/Women/WAccessories.dart';
import 'package:shopping_app/Screens/Catgories/Women/WClothes.dart';
import 'package:shopping_app/Screens/Catgories/Women/WShoes.dart';

class Categories extends StatefulWidget {
  const Categories({Key key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text("Categories",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25)),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: [
            ExpansionTile(
              title: Text(
                "Fashion",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              children: [
                ExpansionTile(
                  title: Text("Men",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  children: [
                    ListTile(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Clothes()));
                      },
                      title: Text("Clothes",
                          style: TextStyle(color: Colors.black, fontSize: 18)),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Shoes()));
                      },
                      title: Text("Shoes",
                          style: TextStyle(color: Colors.black, fontSize: 18)),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Accessories()));
                      },
                      title: Text("Accessories",
                          style: TextStyle(color: Colors.black, fontSize: 18)),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: Text("Women",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  children: [
                    ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WClothes()));
                      },
                      title: Text("Clothes",
                          style: TextStyle(color: Colors.black, fontSize: 18)),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => WShoes()));
                      },
                      title: Text("Shoes",
                          style: TextStyle(color: Colors.black, fontSize: 18)),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WAccessories()));
                      },
                      title: Text("Accessories",
                          style: TextStyle(color: Colors.black, fontSize: 18)),
                    ),
                  ],
                ),
              ],
            ),
            ExpansionTile(
              title: Text("Home Appliance",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              children: [
                ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Electronics()));
                    },
                    title: Text("Electronics",
                        style: TextStyle(color: Colors.black, fontSize: 18))),
              ],
            ),
            ExpansionTile(
              title: Text("Beauty",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              children: [
                ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Beauty()));
                  },
                  title: Text("Beauty & Wellness",
                      style: TextStyle(color: Colors.black, fontSize: 18)),
                )
              ],
            ),
            ExpansionTile(
              title: Text("Kitchen Appliances",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              children: [
                ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Kitchen()));
                  },
                  title: Text("Kitchen",
                      style: TextStyle(color: Colors.black, fontSize: 18)),
                )
              ],
            ),
            ExpansionTile(
              title: Text("Luggage & Travel",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              children: [
                ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Laggage()));
                  },
                  title: Text("Luggage & Travel",
                      style: TextStyle(color: Colors.black, fontSize: 18)),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

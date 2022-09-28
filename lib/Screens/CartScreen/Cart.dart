// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:shopping_app/Screens/CartScreen/CartProducts.dart';
import 'package:shopping_app/Screens/CartScreen/CartTotal.dart';

class Cart extends StatefulWidget {
  const Cart({Key key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text("Cart",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25)),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black, blurRadius: 5, spreadRadius: 3)
          ],
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: CartTotal()
      ),
      body: SingleChildScrollView(
        child: CartProducts(),
      ),
    );
  }
}

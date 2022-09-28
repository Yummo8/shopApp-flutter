// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers, file_names, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/Controller/cart_controller.dart';
import 'package:shopping_app/Screens/Payment_Gateway/Razor_pay.dart';

class CartTotal extends StatefulWidget {
  const CartTotal({Key key}) : super(key: key);

  @override
  State<CartTotal> createState() => _CartTotalState();
}

class _CartTotalState extends State<CartTotal> {
  final CartController controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    print("object");
    return SafeArea(
      child: Obx(
        () => controller != null && controller.total.isNotEmpty
            ? Text("Nothing To Show",
                style: TextStyle(
                    color: Colors.red.shade900,
                    fontSize: 20,
                    fontWeight: FontWeight.bold))
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Total",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  Text("\u{20B9}${controller.total}",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  ElevatedButton(
                      onPressed: () {
                        Get.to(() => Razer_Pay());
                      },
                      child: Text("Pay",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500)))
                ],
              ),
      ),
    );
  }
}

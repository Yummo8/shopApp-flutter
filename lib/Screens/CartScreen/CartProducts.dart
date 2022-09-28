// ignore_for_file: prefer_const_constructors, missing_return, prefer_const_literals_to_create_immutables, unnecessary_brace_in_string_interps, prefer_typing_uninitialized_variables, avoid_unnecessary_containers, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/Controller/cart_controller.dart';
import 'package:shopping_app/DataBase/Model/products_model.dart';

class CartProducts extends StatefulWidget {
  const CartProducts({Key key}) : super(key: key);

  @override
  State<CartProducts> createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  final CartController controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: EdgeInsets.only(bottom: 500),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: controller.products.length,
            itemBuilder: (context, index) {
              return CartProductCard(
                controller: controller,
                product: controller.products.keys.toList()[index],
                quantity: controller.products.values.toList()[index],
                index: index,
              );
            }),
      ),
    );
  }
}

class CartProductCard extends StatelessWidget {
  final CartController controller;
  final Product product;
  final int quantity;
  final int index;
  const CartProductCard(
      {Key key, this.controller, this.product, this.quantity, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
      child: product.name.isEmpty
          ? Center(
              child: Text("Cart Is Empty...",
                  style: TextStyle(
                      color: Colors.red[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(product.images),
                ),
                SizedBox(width: 20),
                Column(children: [
                  Text(product.name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                  Text("\u{20B9}${product.price}",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 14))
                ]),
                // Expanded(
                //     child: Text("${product.price}",
                //         style: TextStyle(
                //             fontWeight: FontWeight.bold, fontSize: 16))),
                IconButton(
                    onPressed: () {
                      controller.removeProduct(product);
                    },
                    icon: Icon(Icons.remove_circle)),
                Text('${quantity}'),
                IconButton(
                    onPressed: () {
                      controller.addProduct(product);
                    },
                    icon: Icon(Icons.add_circle)),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.delete, color: Colors.red)),
              ],
            ),
    );
  }
}

/*controller == null
          ? Center(
              child: Text("Cart Is Empty",
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
            )
          :*/

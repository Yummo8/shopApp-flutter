// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key key}) : super(key: key);

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Text("Privacy Policy",
            style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold)),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Text("MATERIALS:",
                style: TextStyle(
                    letterSpacing: 2,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    decoration: TextDecoration.underline)),
            SizedBox(height: 5),
            Text(
                "We work with monitoring programmes to ensure compliance with safety, health and quality standards for our products. ",
                style: TextStyle(color: Colors.black87, fontSize: 15)),
            SizedBox(height: 10),
            Text("CARE:",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    decoration: TextDecoration.underline)),
            SizedBox(height: 5),
            Text(
                "To keep your jackets and coats clean, you only need to freshen them up and go over them with a cloth or a clothes brush. If you need to dry clean a garment, look for a dry cleaner that uses technologies that are respectful of the environment.",
                style: TextStyle(color: Colors.black87, fontSize: 15)),
            SizedBox(height: 20),
            Row(
              children: [
                Text("1 - ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                Text("Do not use bleach",
                    style: TextStyle(color: Colors.black87, fontSize: 18)),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text("2 - ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                Text("Do not tumble dry",
                    style: TextStyle(color: Colors.black87, fontSize: 18)),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text("3 - ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                Text("Dry clean with tetrachloroethylene",
                    style: TextStyle(color: Colors.black87, fontSize: 18)),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text("4 - ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                Text("Iron at a maximum of 110ºC/230ºF",
                    style: TextStyle(color: Colors.black87, fontSize: 18)),
              ],
            ),
            SizedBox(height: 20),
            ExpansionTile(
                leading:
                    Icon(Icons.local_shipping_outlined, color: Colors.black),
                title: Text("Free Flat Rate Shipping",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
                children: [
                  ListTile(
                    title: Center(
                      child: Text(
                          "Estimated to be delivered on \n 09/11/2021 - 12/11/2021.",
                          style:
                              TextStyle(color: Colors.black87, fontSize: 15)),
                    ),
                  )
                ]),
            ExpansionTile(
                leading: Icon(Icons.policy_outlined, color: Colors.black),
                title: Text("COD Policy",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
                children: [
                  ListTile(
                    title: Center(
                      child: Text(
                          "We accept Cash on Delivery (COD) Payments for major Pincodes all over the India.\nMinimum acceptable amount for COD order is Rs 100 excluding taxes and shipping charge, COD order below Rs. 100 excluding taxes and shipping charge will not be entertained and will be cancelled.\nWe will not entertain any further COD order, if previous COD order is not Delivered or returned back to us by the customer.\nThere is no Separate charge for Cash on Delivery order.\nIf COD is not available for any location, we will inform the customer through phone call or e-mail and update the order status.",
                          style:
                              TextStyle(color: Colors.black87, fontSize: 15)),
                    ),
                  )
                ]),
            ExpansionTile(
                leading: Icon(Icons.policy_outlined, color: Colors.black),
                title: Text("Return Policy",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
                children: [
                  ListTile(
                    title: Center(
                      child: Text(
                          "1 - In cases where a product accessory is found missing/damaged/defective, the seller may either process a replacement of the particular accessory or issue an eGV for an amount equivalent to the price of the accessory, at the seller’s discretion. \n 2 - In certain cases where the seller is unable to process a replacement for any reason whatsoever, a refund will be given. \n3 - During open box deliveries, while accepting your order, if you received a different or a damaged product, you will be given a refund (on the spot refunds for cash-on-delivery orders). Once you have accepted an open box delivery, no return request will be processed, except for manufacturing defects. \n4 - In such cases, these category-specific replacement/return general conditions will be applicable. Click here to know more about Open Box Delivery. \n5 -For Furniture, any product-related issues will be checked by authorised service personnel (free of cost) and attempted to be resolved by replacing the faulty/ defective part of the product. Full replacement will be provided only in cases where the service personnel opines that replacing the faulty/defective part will not resolve the issue.",
                          style:
                              TextStyle(color: Colors.black87, fontSize: 15)),
                    ),
                  )
                ]),
          ],
        ),
      ),
    );
  }
}

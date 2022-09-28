// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_final_fields, avoid_print, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shopping_app/Controller/cart_controller.dart';
import 'package:shopping_app/DataBase/Model/products_model.dart';

class Razer_Pay extends StatefulWidget {
  final Product product;
  const Razer_Pay({Key key, this.product}) : super(key: key);

  @override
  State<Razer_Pay> createState() => _Razer_PayState();
}

class _Razer_PayState extends State<Razer_Pay> {
  final CartController controller = Get.put(CartController());

  var _razorpay = Razorpay();
  var amountController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    print("Payment Done");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    print("Payment Fail");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text("Payment",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25)),
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: 15),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [BoxShadow(color: Colors.black, blurRadius: 2)]),
                // child: TextField(
                //   controller: amountController,
                //   // placeholder: "\u{20B9}${controller.total}",
                //   decoration: InputDecoration(hintText: "Enter Amount", ),
                // ),
                child: Text("\u{20B9}${controller.total}",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 30),
              CupertinoButton(
                  color: Colors.blue,
                  child: Text("Pay Amount",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  onPressed: () {
                    ///Make Payment
                    var options = {
                      'key': 'rzp_test_Hp3hGpygZX3F6d',
                      'amount':
                          (Uri.parse('${controller.total}' * 100)).toString(),
                      'name': 'Open Fashion',
                      'timeout': 1000, //In seconds
                      'prefill': {
                        'contact': '9123456780',
                        'email': 'aditya.17@gmail.com'
                      }
                    };
                    _razorpay.open(options);
                  })
            ],
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _razorpay.clear();
    super.dispose();
  }
}

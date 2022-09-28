// ignore_for_file: prefer_const_constructors, file_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get.dart';
import 'package:shopping_app/Controller/cart_controller.dart';
import 'package:shopping_app/DataBase/Model/products_model.dart';
import 'package:shopping_app/Screens/CartScreen/Cart.dart';

class Electronics extends StatefulWidget {
  const Electronics({Key key}) : super(key: key);

  @override
  State<Electronics> createState() => _ElectronicsState();
}

class _ElectronicsState extends State<Electronics> {
  final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text("Electronics",
            style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold)),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(5),
                alignment: Alignment.center,
                constraints: BoxConstraints.expand(height: 200),
                child: imageSlider(context)),
          ),
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                scrollDirection: Axis.vertical,
                itemCount: Product.electronicsss.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Image.network(Product.electronicsss[index].images,
                          height: 90),
                      Text(Product.electronicsss[index].name,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                      Text("\u{20B9}${Product.electronicsss[index].price}",
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w500,
                              fontSize: 15)),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black38, elevation: 2.0),
                          onPressed: () {
                            cartController
                                .addProduct(Product.electronicsss[index]);
                          },
                          child: Text("Add To Cart",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10)))
                    ],
                  );
                }),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              onPressed: () {
                Get.to(() => Cart());
              },
              child: Text("Go to cart",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600)))
        ],
      ),
    );
  }
}

Swiper imageSlider(context) {
  return Swiper(
    autoplay: true,
    itemBuilder: (BuildContext context, int index) {
      return Image.asset('assets/Images/discount.jpg');
    },
    itemCount: 5,
    viewportFraction: 0.7,
    scale: 0.8,
  );
}

//ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, invalid_use_of_protected_member, unnecessary_null_comparison, file_names

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';
// import 'package:shopping_app/ElectroModel.dart';
//
// import '../../Utils/controller.dart';
//
// class Electronics extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Obx(() => elctroController.electronics.value == null
//         ? CircularProgressIndicator(color: Colors.black)
//         : GridView.count(
//             crossAxisCount: 2,
//             childAspectRatio: .63,
//             padding: EdgeInsets.all(10),
//             mainAxisSpacing: 4.0,
//             crossAxisSpacing: 10,
//             children:
//                 elctroController.electronics.map((ElectroModel electronic) {
//               return SingleProductWidget(
//                 electronic: electronic,
//               );
//             }).toList()));
//   }
// }
//
// class SingleProductWidget extends StatefulWidget {
//   final ElectroModel electronic;
//   const SingleProductWidget({Key? key, required this.electronic})
//       : super(key: key);
//
//   @override
//   State<SingleProductWidget> createState() => _SingleProductWidgetState();
// }
//
// class _SingleProductWidgetState extends State<SingleProductWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(15),
//             boxShadow: [
//               BoxShadow(
//                   color: Colors.grey.withOpacity(0.5),
//                   offset: Offset(3, 2),
//                   blurRadius: 7)
//             ]),
//         child: Column(
//           children: [
//             Padding(
//               padding: EdgeInsets.all(8),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(15),
//                     topRight: Radius.circular(15)),
//                 child:
//                     Image.network(ElectroModel.IMAGE, width: double.infinity),
//               ),
//             ),
//           ],
//         ));
//   }
// }

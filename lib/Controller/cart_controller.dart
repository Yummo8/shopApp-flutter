// ignore_for_file: camel_case_types, prefer_final_fields, prefer_const_constructors

import 'package:get/get.dart';
import 'package:shopping_app/DataBase/Model/products_model.dart';

class CartController extends GetxController {
  var _products = {}.obs;

  void addProduct(Product product) {
    if (_products.containsKey(product)) {
      _products[product] += 1;
    } else {
      _products[product] = 1;
    }

    Get.snackbar(
        "Product Added", "You have added the ${product.name} to the cart",
        snackPosition: SnackPosition.TOP, duration: Duration(seconds: 1));
  }

  get products => _products;

  void removeProduct(Product product) {
    if (_products.containsKey(products) && _products[product] == 1) {
      _products.removeWhere((key, value) => key == product);
    } else {
      _products[product] -= 1;
    }
  }

  void removeItem(int id) {
    final index = _products[products].indexWhere((element) => element.id == id);
    products.removeAt(index);
  }

  get productSubtotal => _products.entries
      .map((product) => product.key.price * product.value)
      .toList();

  get total => _products.entries
      .map((product) => product.key.price * product.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);
}

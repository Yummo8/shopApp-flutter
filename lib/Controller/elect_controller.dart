// import 'package:get/get.dart';
// import 'package:shopping_app/ElectroModel.dart';
// import 'package:shopping_app/Utils/Firebase.dart';
//
// class ElectronicsController extends GetxController {
//   static ElectronicsController instance = Get.find();
//   RxList<ElectroModel> electronics = RxList<ElectroModel>([]);
//   String collection = 'electronics';
//
//   @override
//   void onReady() {
//     // TODO: implement onReady
//     super.onReady();
//     electronics.bindStream(getAllProducts());
//   }
//
//   Stream<List<ElectroModel>> getAllProducts() =>
//       firebaseFirestore.collection(collection).snapshots().map((query) =>
//           query.docs.map((item) => ElectroModel.fromMap(item.data())).toList());
// }

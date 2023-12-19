import 'package:flutter_project/screens/home.dart';
import 'package:get/get.dart';


class SplaceScreenController extends GetxController{
  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(seconds: 3),(){
      Get.offAll(HomePage());
    });
  }
}
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserController extends GetxController{
  @override
  void onInit() {
    GetStorage storageBox = GetStorage();
    if (storageBox.read("userBio") != null)
      {personalInfoText.value = storageBox.read("userBio");
      print(personalInfoText.value);}
    super.onInit();
  }
  final userBiographyController = TextEditingController();
  var personalInfoText = "".obs;
}
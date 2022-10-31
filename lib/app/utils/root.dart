import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialappdemo2/app/home/home_page.dart';
import 'package:socialappdemo2/app/login_register/login_page.dart';
import 'package:socialappdemo2/controllers/authController.dart';

class Root extends GetWidget<AuthController>{
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthController>().user != null) ? Home(): Login();
    });
  }
}

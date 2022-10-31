import 'package:get/get.dart';
import 'package:socialappdemo2/controllers/authController.dart';

class AuthBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
  }
}
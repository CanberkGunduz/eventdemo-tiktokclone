import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialappdemo2/tiktokCloneGetx/controllers/auth_controller.dart';
import 'package:socialappdemo2/tiktokCloneGetx/constants.dart';
import 'package:socialappdemo2/tiktokCloneGetx/views/Screens/Auth/login_screen.dart';
import 'package:socialappdemo2/tiktokCloneGetx/views/Screens/Auth/signup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) {
    Get.put(AuthController());
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Tiktok Clone",
      theme:
          ThemeData.dark().copyWith(scaffoldBackgroundColor: backgroundColor),
      home: SignupScreen(),
    );
  }
}

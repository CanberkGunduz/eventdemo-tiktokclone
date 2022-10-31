import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialappdemo2/app/screens/profile_page.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      // drawer: ,
      appBar: AppBar(
        backgroundColor: Color(0xDBD3D3D3),
        elevation: 8,
        title: Text(
          "App Name",
          style: TextStyle(
            color: Color(0xAFE00B0B),
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => Get.to(() => ProfilePage()),
              icon: Icon(
                CupertinoIcons.profile_circled,
                size: 36,
              )),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: ElevatedButton(
        child: Text("Logout"),
        onPressed:()=> FirebaseAuth.instance.signOut(),
      ),
    );
  }
}

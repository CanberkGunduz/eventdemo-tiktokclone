import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:socialappdemo2/tiktokCloneGetx/views/Screens/add_video_screen.dart';
import 'package:socialappdemo2/tiktokCloneGetx/views/Screens/profile_screen.dart';
import 'package:socialappdemo2/tiktokCloneGetx/views/Screens/search_screen.dart';
import 'package:socialappdemo2/tiktokCloneGetx/views/Screens/video_screen.dart';
import '../tiktokCloneGetx/controllers/auth_controller.dart';

List pages = [
  VideoScreen(),
  SearchScreen(),
  const AddVideoScreen(),
  Text("Messages Screen"),
  ProfileScreen(uid: authController.user.uid),
];

// COLORS
const backgroundColor = Colors.black;
var buttonColor = Colors.red[400];
const borderColor = Colors.grey;

// FIREBASE
var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;

// CONTROLLER
var authController = AuthController.instance;
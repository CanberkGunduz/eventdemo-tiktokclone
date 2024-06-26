import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:socialappdemo2/tiktokCloneGetx/constants.dart';
import '../models/user.dart';

class SearchController extends GetxController {
  final Rx<List<User>> _searchedUsers = Rx<List<User>>([]);

  List<User> get searchedUsers => _searchedUsers.value;

  searchUser(String typedUser) async {
    _searchedUsers.bindStream(firestore
        .collection("users")
        .where("name", isGreaterThanOrEqualTo: typedUser)
        .snapshots()
        .map((QuerySnapshot query) {
      List<User> retval = [];
      for (var elem in query.docs) {
        retval.add(User.fromSnap(elem));
      }
      return retval;
    }));
  }
}

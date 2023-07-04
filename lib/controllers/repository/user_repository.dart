import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:mrkim/constants/styles.dart';
import '../../models/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createUser(UserModel user) async {
    await _db
        .collection("Users")
        .add(user.toJson())
        .whenComplete(() => Get.snackbar(
              "Success",
              "Your Account has been created",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: kPrimaryColor,
              colorText: kSecondary,
            ).printError());
    // ignore: avoid_
  }
}

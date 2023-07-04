import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrkim/getxhelper/auth_controller.dart';

import '../../models/user_model.dart';
import '../../screens/mainscreens/main_page.dart';
import '../repository/user_repository.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  // controllers
  final fullName = TextEditingController();
  final email = TextEditingController();
  final phoneNo = TextEditingController();
  final password = TextEditingController();

  // user repositiory
  final userRepo = Get.put(UserRepository());

  // call functions
  void registerUser(String email, String password) {
    AuthController.instance.register(email, password);
  }

  Future<void> createUser(UserModel user) async {
    await userRepo.createUser(user);
    Get.to(() => const MainPage());
  }
}

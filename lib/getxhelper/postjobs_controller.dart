import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostJobsController extends GetxController {
  static PostJobsController get instance => Get.find();

  // textfields
  final title = TextEditingController();
  final description = TextEditingController();
  final category = TextEditingController();
  final dateposted = TextEditingController();
  final location = TextEditingController();
  final budget = TextEditingController();
}

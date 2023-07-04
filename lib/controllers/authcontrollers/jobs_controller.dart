import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrkim/screens/mainscreens/jobs.dart';
import '../../models/open_jobs_model.dart';
import '../repository/job_repository.dart';

class JobsController extends GetxController {
  static JobsController get instance => Get.put(JobsController());

  // controllers
  final title = TextEditingController();
  final description = TextEditingController();
  final category = TextEditingController();
  final dateposted = TextEditingController();
  final location = TextEditingController();
  final budget = TextEditingController();

  // jobs repositiory
  final jobsRepo = Get.put(PostJobsRepository());

  Future<void> postJobs(JobsModel jobs) async {
    jobsRepo.postJobs(jobs);
    Get.to(() => const JobsPage());
  }
}

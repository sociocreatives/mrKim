import 'package:get/get.dart';
import 'package:mrkim/controllers/repository/job_repository.dart';

class JobsDetailController extends GetxController {
  static JobsDetailController get instance => Get.find();

  final _jobsRepo = Get.put(PostJobsRepository());

  getJobData() {
    _jobsRepo.getJobDetails("title");
  }
}

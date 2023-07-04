import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:mrkim/constants/styles.dart';
import '../../models/open_jobs_model.dart';

class PostJobsRepository extends GetxController {
  static PostJobsRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  postJobs(JobsModel jobs) async {
    await _db
        .collection("jobs")
        .add(jobs.toJson())
        .whenComplete(() => Get.snackbar(
              "Success",
              "A New Job has been created",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: kPrimaryColor,
              colorText: kSecondary,
            ).printError());
    // ignore: avoid_
  }

  // single Job
  Future<JobsModel> getJobDetails(String title) async {
    final snapshot =
        await _db.collection("jobs").where("Title", isEqualTo: title).get();
    final jobsData = snapshot.docs.map((e) => JobsModel.fromSnapshot(e)).single;
    return jobsData;
  }

  // all jobs
  Future<List<JobsModel>> allJobs(String title) async {
    final snapshot = await _db.collection("jobs").get();
    final jobsData =
        snapshot.docs.map((e) => JobsModel.fromSnapshot(e)).toList();
    return jobsData;
  }
}

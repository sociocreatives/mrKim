import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrkim/getxhelper/postjobs_controller.dart';
import '../../constants/styles.dart';
import '../../controllers/authcontrollers/jobs_controller.dart';
import '../../models/open_jobs_model.dart';
import '../auth/login_screen.dart';

class JobsCreation extends StatefulWidget {
  const JobsCreation({super.key});

  @override
  State<JobsCreation> createState() => _JobsCreationState();
}

class _JobsCreationState extends State<JobsCreation> {
  // import controller
  final controller = Get.put(PostJobsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Jobs"),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Create Job",
                    style: TextStyle(
                        color: kBlack,
                        fontSize: 16,
                        fontWeight: FontWeight.w300)),
                const SizedBox(height: 15),
                TextFormField(
                  controller: controller.title,
                  decoration: const InputDecoration(
                      labelText: "Title",
                      hintText: "Enter Title",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person_2_outlined)),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: controller.description,
                  decoration: const InputDecoration(
                      labelText: "Description",
                      hintText: "Enter Description",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email_outlined)),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: controller.category,
                  decoration: const InputDecoration(
                      labelText: "Category",
                      hintText: "Enter Category",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.work_outline)),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: controller.dateposted,
                  decoration: const InputDecoration(
                      labelText: "Date",
                      hintText: "Enter Date",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email_outlined)),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: controller.budget,
                  decoration: const InputDecoration(
                      labelText: "Budget",
                      hintText: "Budget",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)),
                      prefixIcon: Icon(Icons.fingerprint_outlined)),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  obscureText: true,
                  controller: controller.location,
                  decoration: const InputDecoration(
                      labelText: "Location",
                      hintText: "Location",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.fingerprint_outlined)),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      final jobs = JobsModel(
                        title: controller.title.text.trim(),
                        description: controller.description.text.trim(),
                        category: controller.category.text.trim(),
                        dateposted: controller.dateposted.text.trim(),
                        budget: controller.budget.text.trim(),
                        location: controller.location.text.trim(),
                      );
                      JobsController.instance.postJobs(jobs);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(),
                      foregroundColor: kSecondary,
                      backgroundColor: kPrimaryColor,
                      side: BorderSide(color: kPrimaryColor),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: const Text("REGISTER"),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an Account?  ",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w300)),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const LoginScreen());
                        },
                        child: const Text("Sign In",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}

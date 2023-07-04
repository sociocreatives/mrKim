import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mrkim/screens/navigation/navbar.dart';
import '../../database/database_file.dart';
import '../navigation/header.dart';

class JobsPage extends StatefulWidget {
  const JobsPage({super.key});

  @override
  State<JobsPage> createState() => _JobsPageState();
}

class _JobsPageState extends State<JobsPage> {
  // Current User
  final user = FirebaseAuth.instance.currentUser!;

  // document IDs
  List<String> docIDs = [];

  // get doc IDS
  Future getDocId() async {
    await FirebaseFirestore.instance.collection('jobs').get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            print(document.reference);
            docIDs.add(document.reference.id);
          }),
        );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          drawer: Navbar(),
          appBar: AppBar(),
          body: Column(
            children: [
              header(user: user),
              Expanded(
                child: FutureBuilder(
                    future: getDocId(),
                    builder: ((context, snapshot) {
                      return ListView.builder(
                          itemCount: docIDs.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: GetJobsPage(documentId: docIDs[index]),
                            );
                          });
                    })),
              ),
            ],
          )),
    );
  }
}

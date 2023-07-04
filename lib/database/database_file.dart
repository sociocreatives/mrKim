import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mrkim/constants/styles.dart';

class GetJobsPage extends StatelessWidget {
  final String documentId;

  GetJobsPage({required this.documentId});

  @override
  Widget build(BuildContext context) {
    // get collection
    CollectionReference jobs = FirebaseFirestore.instance.collection('jobs');
    return FutureBuilder<DocumentSnapshot>(
        future: jobs.doc(documentId).get(),
        builder: (((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Column(
              children: [
                Card(
                    elevation: 0,
                    color: kWhite,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${data['Title']}',
                            style:
                                TextStyle(color: kPrimaryColor, fontSize: 20.0),
                          ),
                          Text('${data['Description']}',
                              style: TextStyle(
                                  color: kBlack,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w200)),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      color: kSecondary,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0, vertical: 5.0),
                                    child: Text('${data['Category']}'),
                                  )),
                              Text(
                                'Budget: ' '${data['Budget']}',
                                style: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
              ],
            );
          }
          return const Text("loading...");
        })));
  }
}

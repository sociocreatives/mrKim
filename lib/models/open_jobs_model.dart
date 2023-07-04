import 'package:cloud_firestore/cloud_firestore.dart';

class JobsModel {
  final String? id;
  final String title;
  final String description;
  final String category;
  final String dateposted;
  final String location;
  final String budget;

  const JobsModel({
    this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.dateposted,
    required this.location,
    required this.budget,
  });

  toJson() {
    return {
      "Title": title,
      "Description": description,
      "Category": category,
      "Date": DateTime.now(),
      "Location": location,
      "Budget": budget,
    };
  }

  factory JobsModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return JobsModel(
        id: document.id,
        title: data["Title"],
        description: data["Description"],
        category: data["Category"],
        dateposted: data["Date"],
        location: data["Location"],
        budget: data["Budget"]);
  }
}

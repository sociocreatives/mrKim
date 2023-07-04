import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mrkim/constants/styles.dart';

import '../navigation/header.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Current User
  final user = FirebaseAuth.instance.currentUser!;
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          header(user: user),
          Text(
            "Profile",
            style: TextStyle(color: kPrimaryColor),
          )
        ],
      ),
    ));
  }
}

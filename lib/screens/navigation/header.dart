import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../constants/styles.dart';

class header extends StatelessWidget {
  const header({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                      backgroundImage: NetworkImage(user.photoURL!),
                      radius: 20),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(user.displayName!),
                  Text(
                    user.email!,
                    style: TextStyle(
                        fontWeight: FontWeight.w200, color: kPrimaryColor),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

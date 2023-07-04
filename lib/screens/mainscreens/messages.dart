import 'package:flutter/material.dart';

import '../../constants/styles.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({super.key});

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(
          children: [
            Center(
                child: Text(
              "Messages",
              style: TextStyle(fontSize: 25.0, color: kPrimaryColor),
            ))
          ],
        ),
      ),
    ));
  }
}

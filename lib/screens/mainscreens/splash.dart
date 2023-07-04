import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mrkim/constants/styles.dart';
import 'package:mrkim/screens/checks_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // initialize splash screen
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  // function
  _navigatetohome() async {
    await Future.delayed(const Duration(milliseconds: 5000), () {});
    Get.offAll(() => const ChecksPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimaryColor,
        body: Center(
          child: SvgPicture.asset("assets/images/splash_logo.svg"),
        ));
  }
}

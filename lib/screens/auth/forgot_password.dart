import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrkim/constants/styles.dart';
import 'package:mrkim/screens/auth/login_screen.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  // CONTROLLER
  final _emailController = TextEditingController();
  //
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  // Function
  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(
                'Password Reset Link Sent! Check Your Email',
                style: TextStyle(color: kPrimaryColor, fontSize: 18),
              ),
            );
          });
    } on FirebaseAuthException catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(content: Text(e.message.toString()));
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Reset Password",
                  style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w400,
                      color: kPrimaryColor),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28.0),
                  child: Text(
                    textAlign: TextAlign.center,
                    "Enter A Valid Email Address to get a Link to RESET your Password!",
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w200,
                        color: kBlack),
                  ),
                ),
                const SizedBox(height: 15.0),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                      labelText: "Email",
                      hintText: "Enter Email",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email_outlined)),
                ),
                const SizedBox(height: 15.0),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      passwordReset();
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(),
                      foregroundColor: kSecondary,
                      backgroundColor: kPrimaryColor,
                      side: BorderSide(color: kPrimaryColor),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: const Text("RESET PASSWORD"),
                  ),
                ),
                const SizedBox(height: 15.0),
                // Text("GO TO LOGIN", style: TextStyle(color: kPrimaryColor)),
                const SizedBox(height: 15.0),
                GestureDetector(
                    onTap: () {
                      Get.offAll(() => const LoginScreen());
                    },
                    child: const Icon(Icons.arrow_back_sharp))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

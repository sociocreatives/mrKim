import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mrkim/getxhelper/auth_controller.dart';
import 'package:mrkim/models/user_model.dart';
import 'package:mrkim/screens/auth/login_screen.dart';
import 'package:mrkim/screens/mainscreens/main_page.dart';
import '../../constants/styles.dart';
import '../../controllers/authcontrollers/signup_controller.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  // import controller
  final controller = Get.put(SignUpController());

  // controllers
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNoController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneNoController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      Get.to(() => const MainPage());
    } on FirebaseAuthException catch (e) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(content: Text(e.message.toString()));
          });
    }

    // add user detailsn to firestore
    addUserDetails(
      _fullNameController.text.trim(),
      _emailController.text.trim(),
    );
  }

  // user details function
  Future addUserDetails(String fullname, String email) async {
    await FirebaseFirestore.instance.collection('users').add({
      'fullname': fullname,
      'email': email,
    });
  }

//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/images/mrkim_logo.svg",
                  width: 100,
                ),
                const SizedBox(height: 25),
                Text("Welcome to Mr. Kim",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 25,
                        fontWeight: FontWeight.w500)),
                Text("Register to Get Professional Services Near You!",
                    style: TextStyle(
                        color: kBlack,
                        fontSize: 16,
                        fontWeight: FontWeight.w300)),
                const SizedBox(height: 15),
                TextFormField(
                  controller: controller.fullName,
                  decoration: const InputDecoration(
                      labelText: "Full Name",
                      hintText: "Enter Full Name",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person_2_outlined)),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: controller.email,
                  decoration: const InputDecoration(
                      labelText: "Email",
                      hintText: "Enter Email",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email_outlined)),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: controller.phoneNo,
                  decoration: const InputDecoration(
                      labelText: "Phone Number",
                      hintText: "Enter Phone Number",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)),
                      prefixIcon: Icon(Icons.fingerprint_outlined)),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  obscureText: true,
                  controller: controller.password,
                  decoration: const InputDecoration(
                      labelText: "Password",
                      hintText: "Password",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.fingerprint_outlined)),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      final user = UserModel(
                        fullName: controller.fullName.text.trim(),
                        email: controller.email.text.trim(),
                        phoneNo: controller.phoneNo.text.trim(),
                        password: controller.password.text.trim(),
                      );
                      SignUpController.instance.createUser(user);
                      // signUp();
                      // AuthController.instance.register(
                      //   _emailController.text.trim(),
                      //   _passwordController.text.trim(),
                      // );
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
                const Text("OR"),
                const SizedBox(
                  height: 15.0,
                ),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    icon: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Image(
                          image: AssetImage("assets/images/svg_google.png"),
                          width: 20.0),
                    ),
                    onPressed: () {
                      AuthController.instance.signInWithGoogle();
                    },
                    label: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                      child: Text("SIGN UP WITH GOOGLE",
                          style: TextStyle(color: kPrimaryColor)),
                    ),
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

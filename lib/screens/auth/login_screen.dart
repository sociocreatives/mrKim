import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mrkim/constants/styles.dart';
import 'package:mrkim/getxhelper/auth_controller.dart';
import 'package:mrkim/screens/auth/forgot_password.dart';
import 'package:mrkim/screens/auth/registration_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
                Text("Login to Get Professional Services Near You!",
                    style: TextStyle(
                        color: kBlack,
                        fontSize: 16,
                        fontWeight: FontWeight.w300)),
                const SizedBox(height: 15),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                      labelText: "Username",
                      hintText: "Enter Username",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person_2_outlined)),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  obscureText: true,
                  controller: _passwordController,
                  decoration: const InputDecoration(
                      labelText: "Password",
                      hintText: "Enter Password",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)),
                      prefixIcon: Icon(Icons.fingerprint_outlined)),
                ),
                const SizedBox(
                  height: 3.0,
                ),
                TextButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.white,
                          builder: (context) => Container(
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.height * 0.4,
                                child: Padding(
                                  padding: const EdgeInsets.all(30.0),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Make Selection",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: kPrimaryColor,
                                              fontSize: 30.0,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        Text(
                                          "Select one of the options given below to reset your password",
                                          style: TextStyle(
                                              color: kBlack,
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        const SizedBox(
                                          height: 20.0,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Get.to(
                                                () => const ForgotPassword());
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(20.0),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: kWhite,
                                            ),
                                            child: Row(children: [
                                              const Icon(
                                                Icons.mail_outline_rounded,
                                                size: 60.0,
                                              ),
                                              const SizedBox(width: 10.0),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "E-Mail",
                                                    style: TextStyle(
                                                        color: kPrimaryColor,
                                                        fontSize: 18),
                                                  ),
                                                  Text(
                                                      "Reset Via Mail verification",
                                                      style: TextStyle(
                                                          color: kBlack)),
                                                ],
                                              ),
                                            ]),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20.0,
                                        ),
                                        // GestureDetector(
                                        //   onTap: () {},
                                        //   child: Container(
                                        //     padding: const EdgeInsets.all(20.0),
                                        //     decoration: BoxDecoration(
                                        //       borderRadius:
                                        //           BorderRadius.circular(10),
                                        //       color: kWhite,
                                        //     ),
                                        //     child: Row(children: [
                                        //       const Icon(
                                        //         Icons.mobile_friendly_rounded,
                                        //         size: 60.0,
                                        //       ),
                                        //       const SizedBox(width: 10.0),
                                        //       Column(
                                        //         crossAxisAlignment:
                                        //             CrossAxisAlignment.start,
                                        //         children: [
                                        //           Text(
                                        //             "Phone",
                                        //             style: TextStyle(
                                        //                 color: kPrimaryColor,
                                        //                 fontSize: 18),
                                        //           ),
                                        //           Text(
                                        //               "Reset Via Phone Number verification",
                                        //               style: TextStyle(
                                        //                   color: kBlack)),
                                        //         ],
                                        //       ),
                                        //     ]),
                                        //   ),
                                        // )
                                      ]),
                                ),
                              ));
                    },
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(color: kPrimaryColor),
                    )),
                const SizedBox(
                  height: 3.0,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      AuthController.instance.login(
                          _emailController.text.trim(),
                          _passwordController.text.trim());
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(),
                      foregroundColor: kSecondary,
                      backgroundColor: kPrimaryColor,
                      side: BorderSide(color: kPrimaryColor),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: const Text("LOGIN"),
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
                      child: Text("SIGN IN WITH GOOGLE",
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
                      Text("Dont have an Account?  ",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w300)),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const RegistrationPage());
                        },
                        child: const Text("Register",
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

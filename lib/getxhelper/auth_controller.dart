import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrkim/constants/styles.dart';
import 'package:mrkim/screens/auth/login_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mrkim/screens/mainscreens/main_page.dart';

class AuthController extends GetxController {
  // AuthController Instance
  // static AuthController instance = Get.find();
  static AuthController instance = Get.put(AuthController());
  // email, password, name ..
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    // notify user
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  // initialize page
  _initialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => const LoginScreen());
    } else {
      Get.offAll(() => const MainPage());
    }
  }

  // register User
  Future register(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Get.snackbar("About User", "User Registered",
          backgroundColor: kPrimaryColor,
          snackPosition: SnackPosition.TOP,
          titleText: Text(
            "Success",
            style: TextStyle(color: kSecondary),
          ),
          messageText: Text("Account Creation Successfull",
              style: TextStyle(color: kWhite)));
      // ADD MORE FIELDS

      //
    } catch (e) {
      Get.snackbar("About User", "User Not Registered",
          backgroundColor: kDanger,
          snackPosition: SnackPosition.TOP,
          titleText: Text(
            "ERROR",
            style: TextStyle(color: kSecondary, fontSize: 18.0),
          ),
          messageText:
              Text("Account Creation Failed", style: TextStyle(color: kWhite)));
    }
  }

  // login User
  void login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      Get.snackbar("About User", "User Logged In",
          backgroundColor: kPrimaryColor,
          snackPosition: SnackPosition.TOP,
          titleText: Text(
            "SUCCESS",
            style: TextStyle(color: kSecondary, fontSize: 18.0),
          ),
          messageText:
              Text("Login Succefull", style: TextStyle(color: kWhite)));
    } catch (e) {
      Get.snackbar("About User", "User Not Logged In",
          backgroundColor: kDanger,
          snackPosition: SnackPosition.TOP,
          titleText: Text(
            "ERROR",
            style: TextStyle(color: kSecondary, fontSize: 18.0),
          ),
          messageText: Text("Login Failed", style: TextStyle(color: kWhite)));
    }
  }

  // login with Google
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    saveUser(googleUser!);

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> saveUser(GoogleSignInAccount googleUser) async {
    FirebaseFirestore.instance.collection("users").doc(googleUser.email).set({
      "email": googleUser.email,
      "name": googleUser.displayName,
      "profilepic": googleUser.photoUrl,
    });
    print("....saved user data");
  }

  // logout User
  void logout() async {
    await auth.signOut();
  }
}

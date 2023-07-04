// /Route Names
import 'package:get/get.dart';
import 'package:mrkim/screens/auth/forgot_password.dart';
import 'package:mrkim/screens/auth/login_screen.dart';
import 'package:mrkim/screens/auth/registration_screen.dart';
import 'package:mrkim/screens/checks_page.dart';
import 'package:mrkim/screens/mainscreens/jobs_creation.dart';
import 'package:mrkim/screens/mainscreens/main_page.dart';
import 'package:mrkim/screens/mainscreens/splash.dart';

import '../screens/mainscreens/drawer/about.dart';
import '../screens/mainscreens/profile.dart';

class Routes {
  static String splash = '/';
  static String loginScreen = '/login';
  static String registration = '/registration';
  static String checks = '/checks';
  static String password = '/password';
  static String mainpage = '/mainpage';
  static String about = '/about';
  static String profile = '/profile';
  static String createjobs = '/createjobs';
}

// /Reference Pages
final getPages = [
  GetPage(
    name: Routes.checks,
    page: () => const ChecksPage(),
  ),
  GetPage(
    name: Routes.splash,
    page: () => const SplashScreen(),
  ),
  GetPage(
    name: Routes.loginScreen,
    page: () => const LoginScreen(),
  ),
  GetPage(
    name: Routes.registration,
    page: () => const RegistrationPage(),
  ),
  GetPage(
    name: Routes.password,
    page: () => const ForgotPassword(),
  ),
  GetPage(
    name: Routes.mainpage,
    page: () => const MainPage(),
  ),
  GetPage(
    name: Routes.about,
    page: () => const AboutPage(),
  ),
  GetPage(
    name: Routes.profile,
    page: () => const ProfilePage(),
  ),
  GetPage(
    name: Routes.createjobs,
    page: () => const JobsCreation(),
  ),
];

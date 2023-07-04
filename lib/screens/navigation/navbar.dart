import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrkim/constants/styles.dart';
import 'package:mrkim/screens/mainscreens/drawer/about.dart';

import '../../getxhelper/auth_controller.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  // Current User
  final user = FirebaseAuth.instance.currentUser!;
  //

  //
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kWhite,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(0), bottomRight: Radius.circular(0)),
      ),
      child: Column(
        children: <Widget>[
          Expanded(
            // ListView contains a group of widgets that scroll inside the drawer
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text(
                    "Signed in As",
                    style: TextStyle(
                        color: kSecondary, fontWeight: FontWeight.w200),
                  ),
                  accountEmail: Text(user.displayName!),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: ListTile(
                      leading: Icon(
                        Icons.person_2_outlined,
                        color: kPrimaryColor,
                      ),
                      title: Text(
                        'Profile',
                        style: TextStyle(
                            color: kBlack, fontWeight: FontWeight.w300),
                      ),
                      onTap: () {}),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Divider(
                    color: kPrimaryColor,
                    thickness: 1.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: ListTile(
                      leading: Icon(
                        Icons.cases_outlined,
                        color: kPrimaryColor,
                      ),
                      title: Text(
                        'My Jobs',
                        style: TextStyle(
                            color: kBlack, fontWeight: FontWeight.w300),
                      ),
                      onTap: () {}),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Divider(
                    color: kPrimaryColor,
                    thickness: 1.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: ListTile(
                      leading: Icon(
                        Icons.design_services_outlined,
                        color: kPrimaryColor,
                      ),
                      title: Text(
                        'Services',
                        style: TextStyle(
                            color: kBlack, fontWeight: FontWeight.w300),
                      ),
                      onTap: () {}),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Divider(
                    color: kPrimaryColor,
                    thickness: 1.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: ListTile(
                      leading: Icon(
                        Icons.notifications_active_outlined,
                        color: kPrimaryColor,
                      ),
                      title: Text(
                        'Notifications',
                        style: TextStyle(
                            color: kBlack, fontWeight: FontWeight.w300),
                      ),
                      onTap: () {}),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Divider(
                    color: kPrimaryColor,
                    thickness: 1.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.info_outline,
                      color: kPrimaryColor,
                    ),
                    title: Text(
                      'About',
                      style:
                          TextStyle(color: kBlack, fontWeight: FontWeight.w300),
                    ),
                    onTap: () {
                      Get.to(() => const AboutPage());
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Divider(
                    color: kPrimaryColor,
                    thickness: 1.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.logout_outlined,
                      color: kPrimaryColor,
                    ),
                    title: Text(
                      'Logout',
                      style:
                          TextStyle(color: kBlack, fontWeight: FontWeight.w300),
                    ),
                    onTap: () {
                      AuthController.instance.logout();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Divider(
                    color: kPrimaryColor,
                    thickness: 1.0,
                  ),
                ),
              ],
            ),
          ),
          // This container holds the align
          Container(
              // This align moves the children to the bottom
              child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  // This container holds all the children that will be aligned
                  // on the bottom and should not scroll with the above ListView
                  child: Container(
                      child: Column(
                    children: [Image.asset("assets/images/top-service.jpg")],
                  ))))
        ],
      ),
    );
  }
}

// child: ListView(
//         padding: EdgeInsets.zero,
//         children: [
//           UserAccountsDrawerHeader(
//             accountName: Text(
//               "Signed in As",
//               style: TextStyle(color: kSecondary, fontWeight: FontWeight.w200),
//             ),
//             accountEmail: Text(user.email!),
//             currentAccountPicture: CircleAvatar(
//               child: ClipOval(
//                 child: Image.network(
//                   'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTusMQxDB6Ka0esbN9Aoj-kieYMnfEopsLVJe_X735_naS5DtrWRNTktc9jYZS7vOJJQJ0&usqp=CAU',
//                   width: 90,
//                   height: 90,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             decoration: BoxDecoration(
//                 color: kPrimaryColor,
//                 image: const DecorationImage(
//                     image: NetworkImage(
//                       'https://img.freepik.com/premium-photo/abstract-green-plexus-background_161488-73.jpg?w=900',
//                     ),
//                     fit: BoxFit.cover)),
//           ),
//         ],
//       ),

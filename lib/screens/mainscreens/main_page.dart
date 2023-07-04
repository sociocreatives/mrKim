import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrkim/constants/styles.dart';
import 'package:mrkim/screens/mainscreens/dashboard.dart';
import 'package:mrkim/screens/mainscreens/jobs.dart';
import 'package:mrkim/screens/mainscreens/jobs_creation.dart';
import 'package:mrkim/screens/mainscreens/messages.dart';
import 'package:mrkim/screens/mainscreens/profile.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // create a list
  List pages = [
    const Dashboard(),
    const JobsPage(),
    const MessagesPage(),
    const ProfilePage(),
  ];
  //tap function
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        shape: const CircleBorder(),
        backgroundColor: kPrimaryColor,
        foregroundColor: kSecondary,
        child: const Icon(Icons.add),
        onPressed: () {
          Get.to(() => const JobsCreation());
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: pages[currentIndex],
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentIndex = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home_outlined,
                          color: currentIndex == 0 ? kPrimaryColor : kBlack,
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentIndex = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search,
                          color: currentIndex == 1 ? kPrimaryColor : kBlack,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentIndex = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.message_outlined,
                          color: currentIndex == 2 ? kPrimaryColor : kBlack,
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentIndex = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.settings_outlined,
                          color: currentIndex == 3 ? kPrimaryColor : kBlack,
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        // unselectedFontSize: 0,
        // selectedFontSize: 0,
        // onTap: onTap,
        // currentIndex: currentIndex,
        // selectedItemColor: kPrimaryColor,
        // unselectedItemColor: kBlack,
        // showSelectedLabels: false,
        // showUnselectedLabels: false,
        // elevation: 0,
        // items: const [
        //   BottomNavigationBarItem(label: "Dashboard", icon: Icon(Icons.apps)),
        //   BottomNavigationBarItem(
        //       label: "Jobs", icon: Icon(Icons.search_outlined)),
        //   BottomNavigationBarItem(
        //       label: "Messages", icon: Icon(Icons.mail_outline)),
        //   BottomNavigationBarItem(
        //       label: "Profile", icon: Icon(Icons.person_2_outlined)),
        // ]
      ),
    );
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mrkim/constants/styles.dart';
import 'package:mrkim/screens/mainscreens/dashboard.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  // Current User
  final user = FirebaseAuth.instance.currentUser!;
  //

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Center(
                child: Column(
                  children: [
                    SvgPicture.asset(
                      "assets/images/mrkim_logo.svg",
                      width: 100,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CarouselSlider(
                      items: [
                        "assets/images/slides/tuktuk_warranty.svg",
                        "assets/images/slides/home_warranty.svg",
                        "assets/images/slides/automobile_warranty.svg",
                        "assets/images/slides/bodaboda_warranty.svg"
                      ].map((i) {
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            child: SvgPicture.asset(i));
                      }).toList(),
                      options: CarouselOptions(
                        enlargeCenterPage: true,
                        viewportFraction: 1,
                        autoPlay: true,
                        enableInfiniteScroll: true,
                        autoPlayInterval: const Duration(seconds: 4),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                      ),
                    ),
                    Text(
                      "About Mr Kim",
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 28,
                          fontWeight: FontWeight.w200),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Welcome to Mr.KIM, the ONE-STOP-SHOP app that connects you with skilled, trustworthy, reliable, and fully vetted  professional service providers right at your fingertips. Whether you need assistance with home repairs and renovations, general rental maintenance, painting, fixing your vehicle, house cleaning, vehicle cleaning, plumbing, electrical work and more, Mr. KIM got you covered and is here to simplify your life to your doorstep.",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: kBlack,
                          fontSize: 15,
                          fontWeight: FontWeight.w200),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: kSecondary,
                                borderRadius: BorderRadius.circular(30)),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset(
                                "assets/images/courthouse.png",
                                width: 20,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Legal",
                            style:
                                TextStyle(fontSize: 15.0, color: kPrimaryColor),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: kSecondary,
                                borderRadius: BorderRadius.circular(30)),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset(
                                "assets/images/star.png",
                                width: 20,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Rate this App",
                            style:
                                TextStyle(fontSize: 15.0, color: kPrimaryColor),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: kSecondary,
                                borderRadius: BorderRadius.circular(30)),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset(
                                "assets/images/like.png",
                                width: 20,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Like Us on Facebook",
                            style:
                                TextStyle(fontSize: 15.0, color: kPrimaryColor),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: kSecondary,
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: kPrimaryColor,
                          ),
                          onPressed: () {
                            Get.to(() => const Dashboard());
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}

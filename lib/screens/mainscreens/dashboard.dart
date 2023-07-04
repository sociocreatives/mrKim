import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mrkim/constants/styles.dart';
import 'package:mrkim/widgets/categories_search.dart';
import '../../database/database_file.dart';
import '../navigation/navbar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  // Current User
  final user = FirebaseAuth.instance.currentUser!;

  // document IDs
  List<String> docIDs = [];

  // get doc IDS
  Future getDocId() async {
    await FirebaseFirestore.instance.collection('jobs').get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            print(document.reference);
            docIDs.add(document.reference.id);
          }),
        );
  }

  @override
  void initState() {
    getDocId();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (context) => IconButton(
            icon: FaIcon(
              FontAwesomeIcons.bars,
              color: kPrimaryColor,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(user.displayName!),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: CircleAvatar(
                backgroundImage: NetworkImage(user.photoURL!), radius: 20),
          )
        ],
      ),
      drawer: Navbar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome Back!",
                    style: TextStyle(color: kPrimaryColor, fontSize: 23),
                  ),
                  Text(
                    "::" " " + user.displayName!,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                onTap: () {
                  showModalBottomSheet(
                      isScrollControlled: false,
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20))),
                      context: context,
                      builder: (context) => SearchCatergories());
                },
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: kPrimaryColor,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelStyle: TextStyle(
                      color: kPrimaryColor, fontWeight: FontWeight.w200),
                  labelText: "Search Jobs near you",
                  hintText: "Enter Search",
                  hintStyle: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w200,
                      fontSize: 18.0),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 15, horizontal: 20.0),
                  suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.close,
                        color: kPrimaryColor,
                      )),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      "assets/images/slides/icons/search.svg",
                      width: 40,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CarouselSlider(
                items: [
                  "assets/images/slides/tuktuk_warranty.svg",
                  "assets/images/slides/home_warranty.svg",
                  "assets/images/slides/automobile_warranty.svg",
                  "assets/images/slides/bodaboda_warranty.svg"
                ].map((i) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 0),
                      child: SvgPicture.asset(i));
                }).toList(),
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  viewportFraction: 1,
                  autoPlay: true,
                  enableInfiniteScroll: true,
                  autoPlayInterval: const Duration(seconds: 4),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Categories", style: TextStyle(color: kBlack)),
                  GestureDetector(
                    onTap: () {},
                    child: Text("SEE ALL",
                        style: TextStyle(color: kPrimaryColor, fontSize: 12)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SizedBox(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: kWhite,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              "assets/images/slides/icons/laundry.svg",
                              width: 40,
                            ),
                            const SizedBox(width: 10.0),
                            Text(
                              'Laundry',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Container(
                      decoration: BoxDecoration(
                        color: kWhite,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              "assets/images/slides/icons/home_cleaning.svg",
                              width: 40,
                            ),
                            const SizedBox(width: 10.0),
                            Text(
                              'Home Cleaning',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Container(
                      decoration: BoxDecoration(
                        color: kWhite,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              "assets/images/slides/icons/air_conditioning.svg",
                              width: 40,
                            ),
                            const SizedBox(width: 10.0),
                            Text(
                              'A/C Repair',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Container(
                      decoration: BoxDecoration(
                        color: kWhite,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              "assets/images/slides/icons/bathroom.svg",
                              width: 40,
                            ),
                            const SizedBox(width: 10.0),
                            Text(
                              'Bathroom Repair',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Container(
                      decoration: BoxDecoration(
                        color: kWhite,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              "assets/images/slides/icons/cctv.svg",
                              width: 40,
                            ),
                            const SizedBox(width: 10.0),
                            Text(
                              'CCTV Installation',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Latest Opportunities", style: TextStyle(color: kBlack)),
                  GestureDetector(
                    onTap: () {},
                    child: Text("SEE ALL",
                        style: TextStyle(color: kPrimaryColor, fontSize: 12)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Container(
              color: Colors.white,
              height: 250,
              child: FutureBuilder(
                  future: getDocId(),
                  builder: ((context, snapshot) {
                    return ListView.builder(
                        itemCount: docIDs.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: GetJobsPage(documentId: docIDs[index]),
                          );
                        });
                  })),
            ),
          ],
        ),
      ),
    );
  }
}

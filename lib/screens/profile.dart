import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.only(left: 35),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(
              "assets/ic_back.svg",
              width: 10,
              height: 10,
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(right: 20),
              child: SvgPicture.asset(
                "assets/ic_edit.svg",
              ),
            ),
          )
        ],
        title: const Text(
          "Profile",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(child: SingleChildScrollView(child: initWidget())),
    );
  }

  Widget initWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildUserDetails(),
        buildSkills(),
        buildEducationCourses()
      ],
    );
  }

  Widget buildUserDetails() {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(12),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                child: Image.asset(
                  "assets/user.png",
                  fit: BoxFit.fill,
                  height: 70,
                  width: 60,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5),
              child: const Text(
                "Username",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            const Text(
              "Profession",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSkills() {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(left: 10, right: 10, top: 50),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircularPercentIndicator(
                radius: 30.0,
                lineWidth: 4.0,
                animation: true,
                percent: 0.8,
                center: const Text(
                  "70.0%",
                  style: TextStyle(
                    fontSize: 11.0,
                    color: Color(0xffFC9B00)
                  ),
                ),
                footer: Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text(
                    "Contribution",
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: const Color(0xffFC9B00),
              ),
              CircularPercentIndicator(
                radius: 30.0,
                lineWidth: 4.0,
                animation: true,
                percent: 0.8,
                center: const Text(
                  "80.0%",
                  style: TextStyle(
                      fontSize: 11.0,
                      color: Color(0xffEC3B6B)
                  ),
                ),
                footer: Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text(
                    "Encouraging Others",
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: const Color(0xffEC3B6B),
              ),
              CircularPercentIndicator(
                radius: 30.0,
                lineWidth: 4.0,
                animation: true,
                percent: 0.8,
                center: const Text(
                  "80.0%",
                  style: TextStyle(
                      fontSize: 11.0,
                      color: Color(0xffA46BE4)
                  ),
                ),
                footer: Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text(
                    "Helped In Reporting",
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: const Color(0xffA46BE4),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 30),
            child: const Text(
              "See All",
              style: TextStyle(
                  color: Color(0xffAD98C4),
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildEducationCourses() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20, top: 30),
          child: const Text(
            "Latest Tasks In Your Near Areas",
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            children: [
              buildCourseListTile(
                  "Floods Reported",
                  "Town ABC, District 2",
                  "assets/company_one.png"
              ),
              buildCourseListTile(
                  "Volunteer Health Camp",
                  "Town AAA, District 3",
                  "assets/medicine.png"
              ),
              buildCourseListTile(
                  "Education Camp",
                  "District 5, Town CDEF",
                  "assets/education.png"
              ),
              buildCourseListTile(
                  "Hospital Donation",
                  "Town BCD, District 1",
                  "assets/medicine.png",
              ),
              buildCourseListTile(
                  "Plantation Drive",
                  "Town ABB, District 4",
                  "assets/plantation.png"
              ),
              buildCourseListTile(
                  "Beach Cleaning Camp",
                  "Town BBB, District 12",
                  "assets/cleaning.png",
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget buildCourseListTile(String title, String company, String img) {
    return Container(
      margin: const EdgeInsets.only(bottom: 7, top: 7),
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Color(0xffF8F5F5)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Image.asset(
                img,
                height: 35,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 15),
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 15),
                    child: Text(
                      company,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: SvgPicture.asset("assets/ic_more.svg"),
          )
        ],
      ),
    );
  }
}

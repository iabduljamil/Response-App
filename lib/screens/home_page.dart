import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'tasks.dart';
import 'task_details.dart';
import 'profile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            onTap: () {},
            child: SvgPicture.asset(
              "assets/ic_menu.svg",
              width: 10,
              height: 10,
            )
          ),
        ),
        title: const Text(
          "Community Needs You",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: initWidget(),
        ),
      ),
    );
  }

  Widget initWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [ 
        buildProfileComponent(),
        buildSearch(),
        buildCategories(),
        buildPopularCompanies(),
        buildNewOpportunity()
      ],
    );
  }

  Widget buildProfileComponent() {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
      },
      child: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(6)),
            border: Border.all(
                color: Colors.grey.shade400
            )
        ),
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.all(12),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    child: Image.asset(
                      "assets/user.png",
                      fit: BoxFit.fill,
                      height: 60,
                      width: 50,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      child: const Text(
                        "Username",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      child: const Text(
                        "Profession",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              right: 20,
              bottom: 1,
              top: 1,
              child: SvgPicture.asset(
                "assets/ic_message.svg",
              ),
            )
          ]
        ),
      ),
    );
  }

  Widget buildSearch() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Container(
              height: 55,
              padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color: Color(0xffE8E8E8),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.search,
                      size: 25,
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Container(
                      margin: const EdgeInsets.only(left: 5, right: 10),
                      child: Text(
                        'Search for people in need',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: GoogleFonts.roboto().fontFamily,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              padding: const EdgeInsets.only(top: 16, bottom: 17),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color: Colors.black,
              ),
              child: SvgPicture.asset(
                "assets/ic_filter.svg",
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildCategories() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 35),
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          categoryListTile("Causes Joined"),
          categoryListTile("Urgent Help"),
          categoryListTile("Help Resources Reached"),
        ],
      ),
    );
  }

  Widget categoryListTile(String title) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(right: 10),
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xffF8F5F5),
              Color(0xffEEE8F3),
            ],
          ),
          borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500
          ),
        ),
      ),
    );
  }

  Widget buildPopularCompanies() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 35),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Help Required In Nearby Areas",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                ),
              ),
              Text(
                "See All",
                style: TextStyle(
                    color: Color(0xffAD98C4),
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
          Container(
            height: 190,
            margin: const EdgeInsets.only(top: 10),
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                buildPopularCompaniesListTile(
                    "assets/ic_google.svg",
                    "Amount Required \$10K", "Non-profit School Renovation",
                    "District 123, Town ABC"
                ),
                buildPopularCompaniesListTile(
                    "assets/ic_amazon.svg",
                    "Time Required: 2 Hours", "Buy basic necessities to needy",
                    "District 456, Town BCD"
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildPopularCompaniesListTile(String logo, String salary, String jobTitle, String loc) {
    return Container(
      width: 300,
      margin: const EdgeInsets.only(right: 10),
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff7837C2),
              Color(0xff3C1C61),
            ],
          ),
          borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20, top: 20),
                child: SvgPicture.asset(logo),
              ),
              Container(
                margin: const EdgeInsets.only(top: 12, left: 20),
                child: Text(
                  jobTitle,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5, left: 20),
                child: Text(
                  loc,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(right: 10),
                      decoration: const BoxDecoration(
                          color: Color(0xffB392D8),
                          borderRadius: BorderRadius.all(Radius.circular(12))
                      ),
                      child: const Center(
                        child: Text(
                          "Donations",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(right: 10),
                      decoration: const BoxDecoration(
                          color: Color(0xffB392D8),
                          borderRadius: BorderRadius.all(Radius.circular(12))
                      ),
                      child: const Center(
                        child: Text(
                          "Remote",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            right: 1,
            bottom: 1,
            top: 1,
            child: Container(
              margin: const EdgeInsets.only(top: 30, right: 20),
              child: Text(
                salary,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildNewOpportunity() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 35),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Latest Happenings Around",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => AllJobsPage(),
                  ));
                },
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
          Container(
            height: 190,
            margin: const EdgeInsets.only(top: 10),
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              children: [
                buildNewOpportunitiesListTile(
                  "Flood Emergency",
                  "Town ABC, District A",
                  "assets/company_one.png"
                ),
                buildNewOpportunitiesListTile(
                  "Volunteer Teacher",
                  "Town 123, District B",
                  "assets/education.png",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildNewOpportunitiesListTile(String title, String company, String img) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => JobDetailsPage()));
      },
      child: Container(
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
              margin: EdgeInsets.only(right: 10),
              child: SvgPicture.asset("assets/ic_more.svg"),
            )
          ],
        ),
      ),
    );
  }
}

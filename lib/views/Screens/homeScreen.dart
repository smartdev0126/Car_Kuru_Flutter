import 'package:car_kuru/views/bidsScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import '../../styles/colors.dart';
import '../notifications.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TabController _tabController;
  String token;
  TextEditingController searchController;
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);
  static const List<Tab> _tabs = [
    Tab(
      text: "Home",
    ),
    Tab(text: 'Pay Figma'),
    Tab(text: 'Pickup'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 110,
          elevation: 1,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: Container(
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 15),
              decoration: BoxDecoration(
                  color: MyColors.white,
                  borderRadius: BorderRadius.circular(10)),
              child: new TextFormField(
                maxLines: 1,
                style:
                    TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
                controller: searchController,
                onChanged: (String value) async {
                  token = value;
                  //
                  // searchShop(token).then((data) {
                  //   setState(() {
                  //
                  //     searchList = data;
                  //
                  //     print("searching: ");
                  //     print(searchList);
                  //   });
                  // });
                },
                decoration: InputDecoration(
                    isDense: true,
                    prefixIcon: Icon(
                      Icons.search_rounded,
                      color: Colors.grey,
                    ),
                    suffixIcon: Icon(
                      Icons.keyboard_voice_sharp,
                      color: Colors.grey,
                    ),
                    contentPadding:
                        EdgeInsets.only(left: 5, right: 10, top: 13, bottom: 0),
                    border: InputBorder.none,
                    hintText: "Search Now",
                    hintStyle: TextStyle(fontSize: 14)),
              ),
            ),
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BidsScreen()));
                      },
                      child: Image.asset("images/Ok.png")
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Notifications()));
                    },
                    child: Icon(
                      Icons.circle_notifications,
                      size: 26,
                    ),
                  )
                ],
              ),
            ),
          ],
          backgroundColor: MyColors.primaryColor,
          title: Image.asset(
            "images/carkuru_logo.png",
            width: 90,
          )),
      body: SingleChildScrollView(
        child: Container(
          height: 1000,
          width: MediaQuery.of(context).size.width,
          child: DefaultTabController(
            length: 3,
            initialIndex: 0,
            child: Column(
              children: [
                TabBar(
                  labelColor: MyColors.tabColor,
                  unselectedLabelColor: MyColors.tabColor,
                  labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                  unselectedLabelStyle:
                      const TextStyle(fontStyle: FontStyle.normal),
                  indicatorWeight: 2,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: MyColors.primaryColor,
                  isScrollable: true,
                  physics: BouncingScrollPhysics(),
                  onTap: (int index) {
                    print('Tab $index is tapped');
                  },
                  controller: _tabController,
                  tabs: _tabs,
                ),
                Container(
                    height: MediaQuery.of(context)
                        .size
                        .height, //height of TabBarView
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(color: Colors.grey, width: 0.5))),
                    child: TabBarView(children: <Widget>[
                      Container(
                        height: 400,
                        color: MyColors.white,
                        padding: EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 10.0),
                              height: 90.0,
                              child: ListView.builder(
                                itemCount: 10,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, i) {
                                  return Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.grey[100],
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                topRight: Radius.circular(10),
                                                bottomLeft: Radius.circular(10),
                                                bottomRight:
                                                    Radius.circular(10)),
                                          ),
                                          child: Image.asset(
                                            "images/banner_small.png",
                                            fit: BoxFit.contain,
                                            alignment: Alignment.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            Text(
                              "Branded Auction Car",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: MyColors.black),
                            ).tr(),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 10.0),
                              height: 90.0,
                              child: ListView.builder(
                                itemCount: 10,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, i) {
                                  return Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Image.asset(
                                            "images/bmw.png",
                                            fit: BoxFit.contain,
                                            height: 90,
                                            alignment: Alignment.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            Text(
                              "Popular Auction Car",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: MyColors.black),
                            ).tr(),
                            SizedBox(
                              height: 20,
                            ),
                            Expanded(
                              child: GridView.builder(
                                itemCount: 4,
                                shrinkWrap: false,
                                physics: ScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithMaxCrossAxisExtent(
                                        maxCrossAxisExtent: 260,
                                        childAspectRatio: 1,
                                        crossAxisSpacing: 5,
                                        mainAxisSpacing: 5),
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, i) {
                                  return InkWell(
                                    onTap: () {},
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          left: 5, top: 3, right: 5, bottom: 3),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10)),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.1),
                                            spreadRadius: 1,
                                            blurRadius: 2,
                                            offset: Offset(0,
                                                1), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Container(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Stack(children: [

                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 90,
                                                child: Image.asset(
                                                  "images/car.png",
                                                  scale: 1,
                                                  fit: BoxFit.cover,
                                                  alignment:
                                                      Alignment.center,
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    color: Colors.white,
                                                    size: 20,
                                                  ),
                                                  Spacer(),
                                                  Container(
                                                    margin: EdgeInsets.only(top: 5,right: 5),
                                                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                                    decoration: BoxDecoration(
                                                      color: Colors.black,
                                                      borderRadius: BorderRadius.circular(10)
                                                    ),
                                                      child: Text("Latest",style: TextStyle(color: MyColors.white),))
                                                ],
                                              ),
                                            ]),
                                            Container(
                                                padding: EdgeInsets.all(2),
                                                child: Text(
                                                  "Porche",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                            Container(
                                                padding: EdgeInsets.all(1),
                                                child: Text(
                                                  "911 4s Special",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      color: Colors.black),
                                                )),
                                            Container(
                                                padding: EdgeInsets.all(1),
                                                child: Text(
                                                  "\$82300",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height,
                        padding: EdgeInsets.all(20),
                        child: Expanded(
                          child: GridView.builder(
                            itemCount: 10,
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 140,
                                    childAspectRatio: 1,
                                    crossAxisSpacing: 5,
                                    mainAxisSpacing: 5),
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, i) {
                              return InkWell(
                                onTap: () {},
                                child: Container(
                                  margin: EdgeInsets.only(
                                      left: 5, top: 3, right: 5, bottom: 3),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.1),
                                        spreadRadius: 1,
                                        blurRadius: 2,
                                        offset: Offset(
                                            0, 1), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Stack(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 110,
                                        decoration: BoxDecoration(
                                            color: const Color(0xff000000),
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        child: Opacity(
                                          opacity: 0.5,
                                          child: Image.asset(
                                            "images/car.png",
                                            scale: 1,
                                            fit: BoxFit.cover,
                                            alignment: Alignment.center,
                                          ),
                                        ),
                                      ),
                                      Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Porche",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          )),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height,
                        padding: EdgeInsets.all(20),
                        child: Expanded(
                          child: GridView.builder(
                            itemCount: 10,
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 240,
                                    childAspectRatio: 1,
                                    crossAxisSpacing: 5,
                                    mainAxisSpacing: 5),
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, i) {
                              return InkWell(
                                onTap: () {},
                                child: Container(
                                  margin: EdgeInsets.only(
                                      left: 5, top: 3, right: 5, bottom: 3),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.1),
                                        spreadRadius: 1,
                                        blurRadius: 2,
                                        offset: Offset(
                                            0, 1), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 110,
                                        child: Image.asset(
                                          "images/car.png",
                                          scale: 1,
                                          fit: BoxFit.cover,
                                          alignment: Alignment.center,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Container(
                                          margin:
                                              EdgeInsets.only(left: 10, top: 5),
                                          child: Text(
                                            "Porche",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.normal),
                                          )),
                                      Container(
                                          margin:
                                              EdgeInsets.only(left: 10, top: 4),
                                          child: Text(
                                            "911 4s Special",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: MyColors.primaryColor),
                                          )),
                                      SizedBox(
                                        height: 5,
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      )
                    ]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

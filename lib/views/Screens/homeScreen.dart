import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import '../../styles/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TabController _tabController;
  static const List<Tab> _tabs = [
    Tab(
      text: "Home",
    ),
    Tab(text: 'Pay Figma'),
    Tab(text: 'Pickup'),
  ];

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
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
                  height: 1000, //height of TabBarView
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
                                              bottomLeft:
                                              Radius.circular(10),
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
                              shrinkWrap: true,
                              gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,
                                  childAspectRatio: 1,
                                  crossAxisSpacing: 5,
                                  mainAxisSpacing: 5),
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, i) {
                                return InkWell(
                                  onTap: () {},
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        left: 5,
                                        top: 3,
                                        right: 5,
                                        bottom: 3),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10)),
                                      boxShadow: [
                                        BoxShadow(
                                          color:
                                          Colors.grey.withOpacity(0.1),
                                          spreadRadius: 1,
                                          blurRadius: 2,
                                          offset: Offset(0,
                                              1), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 60,
                                          height: 60,
                                          child: Image.asset(
                                            "images/logo.png",
                                            scale: 1,
                                            fit: BoxFit.contain,
                                            alignment:
                                            Alignment.bottomRight,
                                          ),
                                        ),
                                        Spacer(),
                                        Container(
                                            padding: EdgeInsets.all(4),
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
                                        SizedBox(
                                          height: 30,
                                        )
                                      ],
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
                      height: 400,
                      color: MyColors.white,
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                              shrinkWrap: true,
                              gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,
                                  childAspectRatio: 1,
                                  crossAxisSpacing: 5,
                                  mainAxisSpacing: 5),
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, i) {
                                return InkWell(
                                  onTap: () {},
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        left: 5,
                                        top: 3,
                                        right: 5,
                                        bottom: 3),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10)),
                                      boxShadow: [
                                        BoxShadow(
                                          color:
                                          Colors.grey.withOpacity(0.1),
                                          spreadRadius: 1,
                                          blurRadius: 2,
                                          offset: Offset(0,
                                              1), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 60,
                                          height: 60,
                                          child: Image.asset(
                                            "images/logo.png",
                                            scale: 1,
                                            fit: BoxFit.contain,
                                            alignment:
                                            Alignment.bottomRight,
                                          ),
                                        ),
                                        Spacer(),
                                        Container(
                                            padding: EdgeInsets.all(4),
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
                                        SizedBox(
                                          height: 30,
                                        )
                                      ],
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
                      height: 400,
                      color: MyColors.white,
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                              shrinkWrap: true,
                              gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,
                                  childAspectRatio: 1,
                                  crossAxisSpacing: 5,
                                  mainAxisSpacing: 5),
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, i) {
                                return InkWell(
                                  onTap: () {},
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        left: 5,
                                        top: 3,
                                        right: 5,
                                        bottom: 3),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10)),
                                      boxShadow: [
                                        BoxShadow(
                                          color:
                                          Colors.grey.withOpacity(0.1),
                                          spreadRadius: 1,
                                          blurRadius: 2,
                                          offset: Offset(0,
                                              1), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 60,
                                          height: 60,
                                          child: Image.asset(
                                            "images/logo.png",
                                            scale: 1,
                                            fit: BoxFit.contain,
                                            alignment:
                                            Alignment.bottomRight,
                                          ),
                                        ),
                                        Spacer(),
                                        Container(
                                            padding: EdgeInsets.all(4),
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
                                        SizedBox(
                                          height: 30,
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ]))
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:car_kuru/views/Screens/favoriteScreen.dart';
import 'package:car_kuru/views/Screens/searchScreen.dart';
import 'package:car_kuru/views/editprofile.dart';
import 'package:car_kuru/views/loginScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../styles/colors.dart';
import '../bidsScreen.dart';
import '../notifications.dart';
import '../orderHistory.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primaryColor,
        title: Text(
          "Profile",
          style: TextStyle(fontSize: 14),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(left: 30, top: 10, bottom: 10),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: MyColors.grey,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.account_circle,
                        color: MyColors.primaryColor,
                        size: 50,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Tasfiqul Ghani",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.normal),
                    ),
                    Spacer(),
                    Container(
                        child: ElevatedButton(
                            onPressed: () {}, child: Text("Logout"))),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditProfile()));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      Container(
                        color: MyColors.white,
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(15),
                              margin: EdgeInsets.only(left: 20),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.notifications),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Edit Profile",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                            Divider()
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OrderHistory()));
                        },
                        child: Container(
                          color: MyColors.white,
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(15),
                                margin: EdgeInsets.only(left: 20),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.notifications),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "History",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              Divider()
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SearchScreen()));
                        },
                        child: Container(
                          color: MyColors.white,
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(15),
                                margin: EdgeInsets.only(left: 20),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.notifications),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Image Search",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              Divider()
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BidsScreen()));
                        },
                        child: Container(
                          color: MyColors.white,
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(15),
                                margin: EdgeInsets.only(left: 20),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.notifications),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "My Bids",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              Divider()
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FavoriteScreen()));
                        },
                        child: Container(
                          color: MyColors.white,
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(15),
                                margin: EdgeInsets.only(left: 20),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.notifications),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Favorite",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              Divider()
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Notifications()));
                        },
                        child: Container(
                          color: MyColors.white,
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(15),
                                margin: EdgeInsets.only(left: 20),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.notifications),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Notifications",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              Divider()
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          color: MyColors.white,
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(15),
                                margin: EdgeInsets.only(left: 20),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.notifications),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Privacy & Policy",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              Divider()
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                        child: Container(
                          color: MyColors.white,
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(15),
                                margin: EdgeInsets.only(left: 20),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.notifications),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Logout",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                              Divider()
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

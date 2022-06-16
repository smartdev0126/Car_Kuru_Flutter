import 'package:car_kuru/views/Screens/homeScreen.dart';
import 'package:car_kuru/views/Screens/profileScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/user.dart';
import '../styles/colors.dart';
import '../utils/shared_preference.dart';
import '../widget/drawer.dart';
import 'package:easy_localization/easy_localization.dart';

import 'orderhistory.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String token;
  Users user;
  TextEditingController searchController;
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  void initState() {
    setBangla(false);

    getUser().then((data) {
      if (data != null) {
        setState(() {
          user = data;

          print("user id ${user.id}");
        });
      }
    });

    super.initState();
  }

  List<Widget> buildScreens() {
    return [
      HomeScreen(),
      Container(),
      Container(),
      Container(),
      ProfileScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        inactiveColorSecondary: MyColors.primaryColor,
        activeColorPrimary: MyColors.primaryColor,
        activeColorSecondary: MyColors.primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
        title: ("Home"),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.search),
        inactiveColorSecondary: MyColors.primaryColor,
        activeColorPrimary: MyColors.primaryColor,
        activeColorSecondary: MyColors.primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
        title: ("Search"),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.camera_fill),
        inactiveColorSecondary: MyColors.primaryColor,
        activeColorPrimary: MyColors.primaryColor,
        activeColorSecondary: MyColors.primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
        title: ("Camera"),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.star_fill),
        inactiveColorSecondary: MyColors.primaryColor,
        activeColorPrimary: MyColors.primaryColor,
        activeColorSecondary: MyColors.primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
        title: ("Favourite"),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.profile_circled),
        title: ("Profile"),
        inactiveColorSecondary: MyColors.primaryColor,
        activeColorPrimary: MyColors.primaryColor,
        activeColorSecondary: MyColors.primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    Future<bool> showExitPopup() async {
      return await showDialog(
            //show confirm dialogue
            context: context,
            builder: (context) => Container(
              height: 150,
              child: AlertDialog(
                title: Text('Exit App'),
                content: Container(
                  height: 100,
                  child: Column(
                    children: [
                      Text('Do you want to exit an App?'),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.of(context).pop(false),
                            child: Container(
                                color: Colors.black,
                                padding: EdgeInsets.symmetric(
                                    vertical: 7, horizontal: 15),
                                child: Text(
                                  'No',
                                  style: TextStyle(color: Colors.white),
                                )),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () => SystemNavigator.pop(),
                            child: Container(
                                color: MyColors.primaryColor,
                                padding: EdgeInsets.symmetric(
                                    vertical: 7, horizontal: 15),
                                child: Text('Yes',
                                    style: TextStyle(color: Colors.white))),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ) ??
          false; //if showDialouge had returned null, then return false
    }

    return SafeArea(
        child: WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
          key: _scaffoldKey,
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
                    style: TextStyle(
                        fontSize: 16.0, height: 1.0, color: Colors.black),
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
                        contentPadding: EdgeInsets.only(
                            left: 5, right: 10, top: 13, bottom: 0),
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
                      Image.asset("images/Ok.png"),
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
          body: PersistentTabView(
            context,
            controller: _controller,
            screens: buildScreens(),
            items: _navBarsItems(),
            confineInSafeArea: true,
            backgroundColor: MyColors.grey,
            // Default is Colors.white.
            handleAndroidBackButtonPress: true,
            // Default is true.
            resizeToAvoidBottomInset: true,
            // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
            stateManagement: true,
            // Default is true.
            hideNavigationBarWhenKeyboardShows: true,
            // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
            decoration: NavBarDecoration(
              borderRadius: BorderRadius.circular(0.0),
              colorBehindNavBar: Colors.white,
            ),
            popAllScreensOnTapOfSelectedTab: true,

            popActionScreens: PopActionScreensType.all,
            itemAnimationProperties: ItemAnimationProperties(
              // Navigation Bar's items animation properties.
              duration: Duration(milliseconds: 200),
              curve: Curves.ease,
            ),
            screenTransitionAnimation: ScreenTransitionAnimation(
              // Screens transition animation on change of selected tab.
              animateTabTransition: true,
              curve: Curves.ease,
              duration: Duration(milliseconds: 200),
            ),
            navBarStyle: NavBarStyle
                .style11, // Choose the nav bar style with this property.
          )),
    ));
  }

  setBangla(bool u) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'bangla';
    prefs.setBool(key, u);
  }
}

import 'package:car_kuru/views/Screens/cameraScreen.dart';
import 'package:car_kuru/views/Screens/favoriteScreen.dart';
import 'package:car_kuru/views/Screens/homeScreen.dart';
import 'package:car_kuru/views/Screens/profileScreen.dart';
import 'package:car_kuru/views/Screens/searchScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/user.dart';
import '../styles/colors.dart';
import '../utils/shared_preference.dart';
import 'package:easy_localization/easy_localization.dart';

import 'notifications.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Users user;

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
      SearchScreen(),
      CameraScreen(),
      FavoriteScreen(),
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

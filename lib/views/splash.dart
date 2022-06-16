
import 'package:car_kuru/models/user.dart';
import 'package:car_kuru/styles/colors.dart';
import 'package:car_kuru/utils/shared_preference.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              color: MyColors.white,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "images/logo.png",
                      height: 120,
                      // color: Colors.black,
                    ),
                    SizedBox(height: 5,),
                    Image.asset(
                      "images/carkuru_logo2.png",
                      height: 60,
                      // color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

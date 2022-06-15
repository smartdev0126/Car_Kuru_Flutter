
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/user.dart';
import '../styles/colors.dart';
import '../utils/shared_preference.dart';
import '../widget/drawer.dart';
import 'package:easy_localization/easy_localization.dart';
class HomePage extends StatefulWidget {


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Users user;

  @override
  void initState() {
    setBangla(false);

    getUser().then((data){
      if(data!=null){
        setState(() {
          user = data;

          print("user id ${user.id}");

        });
      }

    });




    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future<bool> showExitPopup() async {
      return await showDialog( //show confirm dialogue
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
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(false),
                        child: Container(
                            color: Colors.green,
                            padding: EdgeInsets.symmetric(vertical: 7,horizontal: 15),
                            child: Text('No',style: TextStyle(color: Colors.white),)),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () => SystemNavigator.pop(),
                        child: Container(
                            color: Colors.red,
                            padding: EdgeInsets.symmetric(vertical: 7,horizontal: 15),
                            child: Text('Yes',style: TextStyle(color: Colors.white))),
                      ),
                    ],
                  )
                ],
              ),
            ),

          ),
        ),
      )??false; //if showDialouge had returned null, then return false
    }


    return SafeArea(
        child: WillPopScope(
          onWillPop: showExitPopup,
          child: Scaffold(

            key: _scaffoldKey,
            drawer: MyDrawer(),
            appBar: AppBar(
              elevation: 1,
              actions: [


                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    DropdownButton<String>(
                      hint: Icon(Icons.language),
                      iconSize: 0,
                      underline: SizedBox(height: 0,),
                      items: <String>['English', 'Bangla']
                          .map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(
                            value,
                            style:
                            TextStyle(color: Colors.black),
                          ),
                        );
                      }).toList(),
                      onChanged: (v) {

                      },
                    )
                  ],
                ),
              ],
              backgroundColor: MyColors.primaryColor,
              leading: InkWell(
                  onTap:() => _scaffoldKey.currentState.openDrawer(),
                  child: Icon(Icons.menu, color: MyColors.white)
              ),
              //title: Image.asset("images/logo.png",width: 60,color: Colors.white,)
              title: Text("app_title",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color:MyColors.white),textAlign: TextAlign.center,).tr(),
            ),
            body: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height-32,
                child: Column(
                  children: [
                    Container(
                      height: 180,
                      color: MyColors.white,
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Deliver now",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: MyColors.black),).tr(),
                          SizedBox(height: 20,),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    SizedBox(height: 10,),
                                    Text("Regular Delivery",style: TextStyle(fontSize: 9,fontWeight: FontWeight.bold,color: MyColors.primaryColor),).tr()
                                  ],
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    SizedBox(height: 10,),
                                    Text("Urgent Delivery",style: TextStyle(fontSize: 9,fontWeight: FontWeight.bold,color: MyColors.primaryColor),).tr()
                                  ],
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),


                  ],
                ),
              ),
            ),

          ),
        )
    );
  }


  setBangla(bool u) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'bangla';
    prefs.setBool(key, u);
  }

}

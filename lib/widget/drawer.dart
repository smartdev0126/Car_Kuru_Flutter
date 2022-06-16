
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../models/user.dart';
import '../styles/colors.dart';
import '../utils/shared_preference.dart';
import '../views/editprofile.dart';
import '../views/homepage.dart';
import '../views/loginScreen.dart';
import '../views/orderhistory.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {

  String url = 'http://dswiftbd.com/terms/';

  String name="", phone="";

  Users user;
  int id = 0;
  bool err = false;
  String msgErr = '';

  @override
  void initState() {

    getUser().then((data){
      if(data!=null){
        setState(() {
          user = data;
          name = user.name;
          phone = user.phone;
          id = user.id;
        });
      }

    });


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 0,bottom: 0),
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: MyColors.primaryColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(),
                    Container(
                      child:  Container(
                        width: 60,
                        height: 60,
                        child: Icon(Icons.account_circle_sharp, size: 60,color: MyColors.white,),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: MyColors.primaryColor),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Text("${name}",style: TextStyle(fontSize: 12,color: Colors.white),),
                        Spacer(),
                        InkWell(
                            onTap: (){
                              if(user!=null){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfile(user)));
                              }else{

                              }
                            },
                            child: Icon(Icons.edit,color: MyColors.white,)
                        )
                      ],
                    ),
                    Text('${phone}',style: TextStyle(fontSize: 12,color: Colors.white),),
                    SizedBox(height: 10,),
                  ],
                ),
              ),
              InkWell(
                onTap:(){
                  print("User type: ${user.phone}");
                  if(user.userType==1){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                  }else{
                  }
                },
                child: ListTile(
                  //tileColor: MyColors.secondaryColor.withOpacity(0.3),
                  leading: Icon(Icons.dashboard,color: Colors.grey,),
                  title: Text('Dashboard').tr(),
                ),
              ),
              InkWell(
                onTap:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Notifications()));
                },
                child: ListTile(
                  leading: Icon(Icons.list,color: Colors.grey,),
                  title: Text('Order History').tr(),
                ),
              ),




              //
              // InkWell(
              //   onTap:(){
              //     UrlLauncher.launch("tel://+8801780385831");
              //   },
              //   child: ListTile(
              //     leading: Icon(Icons.phone,color: Colors.grey,),
              //     title: Text('${tr("Contact")}/${tr("Helpline")}'),
              //   ),
              // ),

              InkWell(
                onTap:(){

                },
                child: ListTile(
                  leading: Icon(Icons.share,color: Colors.grey,),
                  title: Text('Refer the app').tr(),
                ),
              ),
              InkWell(
                onTap:(){
                  deleteUser();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: ListTile(
                  leading: Icon(Icons.logout,color: Colors.grey,),
                  title: Text('Logout').tr(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

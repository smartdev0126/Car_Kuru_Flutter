
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../models/user.dart';
import '../styles/colors.dart';
import '../utils/shared_preference.dart';

class EditProfile extends StatefulWidget {

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final addressController = TextEditingController();
  final passController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  int _payment = 1;
  String name;
  Users user;

  @override
  void initState() {
    getUser().then((data) {
      setState(() {
        user = data;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              elevation: 1,
              backgroundColor: MyColors.primaryColor,
              leading: InkWell(
                  onTap:() => _scaffoldKey.currentState.openDrawer(),
                  child: Icon(Icons.menu, color: MyColors.white)
              ),
              title: Text("Edit Profile",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color:MyColors.white),textAlign: TextAlign.center,).tr(),
            ),
            body: user ==null ? Container(): SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(left: 20,right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[

                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: MyColors.grey,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Icon(
                          Icons.account_circle,
                          color: MyColors.white,
                          size: 90,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Stack(
                        children: <Widget>[
                          Container(
                              width: double.infinity,
                              margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                              height: 50,
                              decoration: BoxDecoration(
                                  color: MyColors.grey,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(left: 20),
                                    height: 22,
                                    width: 22,
                                    child: Icon(
                                      Icons.person,
                                      color: Colors.black54,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              )),
                          Container(
                              height: 50,
                              margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                              child: TextField(
                                textAlign: TextAlign.center,
                                enabled: false,
                                decoration: InputDecoration(
                                  hintText: "${user.name}",
                                  focusedBorder: InputBorder.none,
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(color: Colors.black),
                                ),
                                style: TextStyle(fontSize: 14, color: Colors.black),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Stack(
                        children: <Widget>[
                          Container(
                              width: double.infinity,
                              margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                              height: 50,
                              decoration: BoxDecoration(
                                  color: MyColors.grey,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(left: 20),
                                    height: 22,
                                    width: 22,
                                    child: Icon(
                                      Icons.phone,
                                      color: Colors.black54,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              )),
                          Container(
                              height: 50,
                              margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                              child: TextField(
                                textAlign: TextAlign.center,
                                enabled: false,
                                decoration: InputDecoration(
                                  hintText: "${user.phone}",
                                  focusedBorder: InputBorder.none,
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(color: Colors.black),
                                ),
                                style: TextStyle(fontSize: 14, color: Colors.black),
                              )),
                        ],
                      ),


                      SizedBox(
                        height: 16,
                      ),

                      Stack(
                        children: <Widget>[
                          Container(
                              width: double.infinity,
                              margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                              height: 50,
                              decoration: BoxDecoration(
                                  color: MyColors.grey,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(left: 20),
                                    height: 22,
                                    width: 22,
                                    child: Icon(
                                      Icons.home,
                                      color: Colors.black54,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              )),
                          Container(
                              height: 50,
                              margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                              child: TextField(
                                textAlign: TextAlign.center,
                                controller: addressController,
                                decoration: InputDecoration(
                                  hintText: "${user.address}",
                                  focusedBorder: InputBorder.none,
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(color: Colors.grey),
                                ),
                                style: TextStyle(fontSize: 14, color: Colors.black),
                              )),
                        ],
                      ),



                      SizedBox(
                        height: 16,
                      ),

                      Stack(
                        children: <Widget>[
                          Container(
                              width: double.infinity,
                              margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                              height: 50,
                              decoration: BoxDecoration(
                                  color: MyColors.grey,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(left: 20),
                                    height: 22,
                                    width: 22,
                                    child: Icon(
                                      Icons.email,
                                      color: Colors.black54,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              )),
                          Container(
                              height: 50,
                              margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                              child: TextField(
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  hintText: "${user.email}",
                                  focusedBorder: InputBorder.none,
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(color: Colors.grey),
                                ),
                                style: TextStyle(fontSize: 14, color: Colors.black),
                              )),
                        ],
                      ),

                      SizedBox(
                        height: 16,
                      ),

                      _submitButton(),

                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )
            )
        )
    );
  }

  Widget _submitButton() {
    return InkWell(
      onTap: (){
        if(addressController.text.isEmpty==true && passController.text.isEmpty==true){
          Fluttertoast.showToast(
              msg: tr("Nothing to change"),
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
          );
        }else{
          // String address;
          // String pass;
          //
          // address = addressController.text.isEmpty ? widget.user.address : addressController.text;
          // pass = passController.text.isEmpty ? widget.user.password : passController.text;
          //
          // user = Users(name: widget.user.name,businessName:widget.user.businessName,phone:widget.user.phone,email: widget.user.email,mobileId:widget.user.mobileId,password:pass,userType:widget.user.userType,address: address,status: widget.user.status);

        }

      },
      child: Container(
          height: 50,
          width: MediaQuery
              .of(context)
              .size
              .width,
          padding: EdgeInsets.symmetric(vertical: 13),
          margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey,
                    offset: Offset(2, 4),
                    blurRadius: 5,
                    spreadRadius: 2)
              ],
              color: MyColors.primaryColor,),
          child: Text(
            'Save',
            style: TextStyle(fontSize: 16, color: MyColors.white),
          ).tr()),
    );
  }

}

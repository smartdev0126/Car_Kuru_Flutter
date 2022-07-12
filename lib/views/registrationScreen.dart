import 'package:car_kuru/styles/colors.dart';
import 'package:car_kuru/utils/api.dart';
import 'package:car_kuru/views/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:easy_localization/easy_localization.dart';

import '../models/user.dart';

class RegistrationScreen extends StatefulWidget {
  RegistrationScreen();

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  final passController = TextEditingController();

  String phone, pass, ownername, email, address;
  String deviceId;

  @override
  Future<void> setState(VoidCallback fn) async {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 1,
            backgroundColor: MyColors.white,
            leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back, color: MyColors.primaryColor)),
            title: Text(
              "Register Now",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: MyColors.primaryColor),
              textAlign: TextAlign.center,
            ).tr(),
          ),
          body: SingleChildScrollView(
              child: Container(
            height: MediaQuery.of(context).size.height,
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Image.asset(
                  "images/carkuru_logo2.png",
                  height: 60,
                ),
                SizedBox(
                  height: 15,
                ),
                Stack(
                  children: <Widget>[
                    Container(
                        width: double.infinity,
                        margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(50)),
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
                          controller: nameController,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: tr('Full Name'),
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
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(50)),
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
                        )
                    ),
                    Container(
                        height: 50,
                        margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                        child: TextField(
                          controller: emailController,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: tr('Email'),
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
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(50)),
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
                        )
                    ),
                    Container(
                        height: 50,
                        margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                        child: TextField(
                          controller: addressController,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: tr('Address'),
                            focusedBorder: InputBorder.none,
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        )),
                  ],
                ),
                SizedBox(height: 16,),
                Stack(
                  children: <Widget>[
                    Container(
                        width: double.infinity,
                        margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(50)),
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
                          controller: phoneController,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: tr('Phone Number'),
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
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(50)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              height: 22,
                              width: 22,
                              child: Icon(
                                Icons.vpn_key,
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
                        child: TextFormField(
                          controller: passController,
                          textAlign: TextAlign.center,
                          obscureText: true,
                          keyboardType: TextInputType.phone,
                          obscuringCharacter: "*",
                          decoration: InputDecoration(
                            hintText: tr('Password'),
                            focusedBorder: InputBorder.none,
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        )),
                  ],
                ),
                SizedBox(
                  height: 26,
                ),
                _submitButton(),
                SizedBox(
                  height: 16,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: MyColors.black),
                    ).tr(),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: MyColors.primaryColor),
                      ).tr(),
                    ),
                  ],
                )
              ],
            ),
          ))),
    );
  }

  Widget _submitButton() {
    return InkWell(
      onTap: () {
        print(phoneController.text.length);
        if (phoneController.text.length == 11) {
          ownername = nameController.text.trim();
          phone = phoneController.text.trim();
          pass = passController.text.trim();
          email = emailController.text.trim();
          address = addressController.text.trim();

          Users user = Users(
              name: ownername,
              phone: phone,
              email: email,
              password: pass,
              address: address,
              lat: 0,
              lng: 0,
              isActive: true,
              status: 1);

          print(user);
          userCreate(user).then((data) {
            setState(() {
              if (data == 201) {
                Fluttertoast.showToast(
                    msg: tr("Successfully registered"),
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              } else {
                Fluttertoast.showToast(
                    msg: tr("Failed to create user"),
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
              }
            });
          });
        } else {
          final snackBar = SnackBar(
              content: Text(
            'Please Enter Phone Number Correctly!!!',
            style: TextStyle(color: Colors.red),
          ).tr());
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(vertical: 13),
          margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey,
                    offset: Offset(2, 4),
                    blurRadius: 5,
                    spreadRadius: 2)
              ],
              color: MyColors.primaryColor),
          child: Text(
            'Register',
            style: TextStyle(fontSize: 16, color: MyColors.white),
          ).tr()),
    );
  }
}

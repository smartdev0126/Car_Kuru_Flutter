
import 'package:car_kuru/views/registrationScreen.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../models/user.dart';
import '../styles/colors.dart';
import '../utils/api.dart';
import '../widget/bezierContainer.dart';
import 'homepage.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final phoneController = TextEditingController();
  final passController = TextEditingController();

  String phone;
  String pass;
  bool _obscureText = true;

  @override
  void initState() {
    _obscureText = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
                Image.asset(
                  "images/carkuru_logo2.png",
                  height: 70,
                ),
                SizedBox(
                  height: 20,
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
                            hintText: tr('Phone'),
                            focusedBorder: InputBorder.none,
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                          style: TextStyle(fontSize: 16, color: Colors.black),
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
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
                      padding: EdgeInsets.fromLTRB(30, 5, 0, 5),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: passController,
                        textAlign: TextAlign.center,
                        obscureText: _obscureText,
                        obscuringCharacter: "*",
                        //This will obscure text dynamically
                        decoration: InputDecoration(
                          hintText: tr('Password'),
                          focusedBorder: InputBorder.none,
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.grey),
                          suffixIcon: IconButton(
                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              _obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Theme.of(context).primaryColorDark,
                            ),
                            onPressed: () {
                              // Update the state i.e. toogle the state of passwordVisible variable
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                _submitButton(),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: (){
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    alignment: Alignment.center,
                    child: Text('${tr("Forget Password")} ?',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey)),
                  ),
                ),
                _createAccountLabel(),
                Spacer(),
              ],
            ),
          ),
          Positioned(top: 40, left: 0, child: _backButton()),
          Positioned(
              top: -MediaQuery.of(context).size.height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: BezierContainer())
        ],
      ),
    )));
  }

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Back',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)).tr()
          ],
        ),
      ),
    );
  }

  Widget _entryField(String title, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              obscureText: isPassword,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Widget _submitButton() {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
        // phone = phoneController.text.trim();
        // pass = passController.text.trim();
        // if (phone.length < 1 && pass.length < 1) {
        //   final snackBar = SnackBar(
        //       content: Text(
        //     'Enter ${tr("Email")} / ${tr("Password")} !',
        //     style: TextStyle(color: Colors.red),
        //   ));
        //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
        // } else {
        //   login(phone, pass).then((data) {
        //     Users user = data[0];
        //     setState(() {
        //       if (data.length > 0) {
        //         if (user.userType == 1) {
        //           Navigator.push(context,
        //               MaterialPageRoute(builder: (context) => HomePage()));
        //         } else {
        //         }
        //       } else {
        //         print(data.length);
        //         final snackBar = SnackBar(
        //             content: Text(
        //           'Login Failed',
        //           style: TextStyle(color: Colors.red),
        //         ).tr());
        //         ScaffoldMessenger.of(context).showSnackBar(snackBar);
        //       }
        //     });
        //   });
        //
        // }
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
            'Login',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ).tr()),
    );
  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          Text('or'),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  Widget _createAccountLabel() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 00),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Dont have an account',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ).tr(),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RegistrationScreen()));
            },
            child: Text(
              'Register',
              style: TextStyle(
                  color: MyColors.primaryColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ).tr(),
          )
        ],
      ),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryField(tr("Phone")),
        _entryField(tr("Password"), isPassword: true),
      ],
    );
  }
}

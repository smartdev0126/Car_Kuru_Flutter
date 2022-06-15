import 'package:car_kuru/styles/colors.dart';
import 'package:car_kuru/utils/api.dart';
import 'package:car_kuru/widget/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class Terms extends StatefulWidget {
  @override
  _TermsState createState() => _TermsState();
}

class _TermsState extends State<Terms> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();



  String terms = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(

            key: _scaffoldKey,
            drawer: MyDrawer(),
            appBar: AppBar(
              elevation: 1,
              backgroundColor: MyColors.primaryColor,
              leading: InkWell(
                  onTap:() => _scaffoldKey.currentState.openDrawer(),
                  child: Icon(Icons.menu, color: MyColors.white)
              ),
              title: Text("Terms",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color:MyColors.white),textAlign: TextAlign.center,).tr(),
            ),
            body: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(left: 30,right: 30,top: 20),
                  child: Text(
                    terms,
                    style: TextStyle(fontSize: 14,color:MyColors.black),textAlign: TextAlign.justify,softWrap: true,),
                )
            )
        )
    );
  }


}

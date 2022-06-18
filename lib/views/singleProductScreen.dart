import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../styles/colors.dart';

class SingleProductScreen extends StatefulWidget {
  const SingleProductScreen({Key key}) : super(key: key);

  @override
  _SingleProductScreenState createState() => _SingleProductScreenState();
}

class _SingleProductScreenState extends State<SingleProductScreen> {
  TextEditingController searchController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primaryColor,
        title: Text("Product Name",style: TextStyle(fontSize: 14),),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [

              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "images/bike.jpg",
                      height: 220,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ),
                  ],
                ),
                  Container(
                      margin: EdgeInsets.only(top: 5,right: 5),
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Text("Latest",style: TextStyle(color: MyColors.white),))
              )
            ],
          ),
        ),
      ),
    );
  }
}

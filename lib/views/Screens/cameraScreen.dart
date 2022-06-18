import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../styles/colors.dart';
import '../notifications.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key key}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  TextEditingController searchController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                style:
                TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
                controller: searchController,
                onChanged: (String value) async {
                  // token = value;
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
                    contentPadding:
                    EdgeInsets.only(left: 5, right: 10, top: 13, bottom: 0),
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
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.all(30),
                    color: MyColors.grey,
                    child: Image.asset(
                      "images/gallery.png",
                      width: 70,
                      height: 70,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.all(30),
                    color: MyColors.grey,
                    child: Image.asset(
                      "images/camera.png",
                      width: 70,
                      height: 70,
                    ),
                  )
                ],
              ),

              Container(
                height: MediaQuery.of(context).size.height,
                child: Expanded(
                  child:  ListView.builder(
                    itemCount: 10,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, i) {
                      return Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(left: 10,bottom: 10,right: 10),
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: Offset(0, 2), // changes position of shadow
                            ),
                          ],

                          color: MyColors.white,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right:10),
                              child:    Image.asset(
                                "images/car.png",
                                height: 100,
                                fit: BoxFit.contain,
                                alignment: Alignment.center,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(height: 7,),
                                Text("Toyota Cover Van",textAlign:TextAlign.start,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black),),
                                SizedBox(height: 10,),
                                Text("\$ 9000",textAlign:TextAlign.start,style: TextStyle(fontSize: 14,color: Colors.red,fontWeight: FontWeight.bold),),
                                SizedBox(height: 2,),
                                Row(
                                  children: [
                                    Icon(Icons.verified,size: 15,),
                                    SizedBox(width: 8,),
                                    Text("6 Bids")
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../styles/colors.dart';
import 'notifications.dart';

class SortScreen extends StatefulWidget {
  const SortScreen({Key key}) : super(key: key);

  @override
  _SortScreenState createState() => _SortScreenState();
}

class _SortScreenState extends State<SortScreen> {
  TextEditingController searchController;
  double _value = 40.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //     automaticallyImplyLeading: false,
      //     toolbarHeight: 110,
      //     elevation: 1,
      //     bottom: PreferredSize(
      //       preferredSize: Size.fromHeight(0),
      //       child: Container(
      //         height: 40,
      //         padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
      //         margin: EdgeInsets.only(left: 10, right: 10, bottom: 15),
      //         decoration: BoxDecoration(
      //             color: MyColors.white,
      //             borderRadius: BorderRadius.circular(10)),
      //         child: new TextFormField(
      //           maxLines: 1,
      //           style:
      //               TextStyle(fontSize: 16.0, height: 1.0, color: Colors.black),
      //           controller: searchController,
      //           onChanged: (String value) async {},
      //           decoration: InputDecoration(
      //               isDense: true,
      //               prefixIcon: Icon(
      //                 Icons.search_rounded,
      //                 color: Colors.grey,
      //               ),
      //               suffixIcon: Icon(
      //                 Icons.keyboard_voice_sharp,
      //                 color: Colors.grey,
      //               ),
      //               contentPadding:
      //                   EdgeInsets.only(left: 5, right: 10, top: 13, bottom: 0),
      //               border: InputBorder.none,
      //               hintText: "Search Now",
      //               hintStyle: TextStyle(fontSize: 14)),
      //         ),
      //       ),
      //     ),
      //     actions: [
      //       Container(
      //         margin: EdgeInsets.only(right: 10),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: <Widget>[
      //             Image.asset("images/Ok.png"),
      //             GestureDetector(
      //               onTap: () {
      //                 Navigator.push(
      //                     context,
      //                     MaterialPageRoute(
      //                         builder: (context) => Notifications()));
      //               },
      //               child: Icon(
      //                 Icons.circle_notifications,
      //                 size: 26,
      //               ),
      //             )
      //           ],
      //         ),
      //       ),
      //     ],
      //     backgroundColor: MyColors.primaryColor,
      //     title: Image.asset(
      //       "images/carkuru_logo.png",
      //       width: 90,
      //     )),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: MyColors.primaryColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                padding: EdgeInsets.all(15),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap:(){
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: MyColors.white,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 40,
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                      width: MediaQuery.of(context).size.width - 80,
                      decoration: BoxDecoration(
                          color: MyColors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: new TextFormField(
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 16.0, height: 1.0, color: Colors.black),
                        controller: searchController,
                        onChanged: (String value) async {},
                        decoration: InputDecoration(
                            isDense: true,
                            suffixIcon: Icon(
                              Icons.keyboard_voice_sharp,
                              color: Colors.grey,
                            ),
                            contentPadding: EdgeInsets.only(
                                left: 5, right: 10, top: 13, bottom: 0),
                            border: InputBorder.none,
                            hintText: "Search Now",
                            hintStyle: TextStyle(fontSize: 14)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              SfSlider(
                min: 0.0,
                max: 1000.0,
                value: _value,
                inactiveColor: MyColors.grey2,
                activeColor: MyColors.primaryColor,
                showTicks: true,
                showLabels: true,
                stepSize: 50,
                enableTooltip: true,
                minorTicksPerInterval: 1,
                onChanged: (dynamic value){
                  setState(() {
                    _value = value;
                  });
                },
              ),
              Center(
                child: Text(
                  "Price Range: ${_value}",
                  style: TextStyle(
                    color: MyColors.primaryColor,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                margin: EdgeInsets.only(top: 20),
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 30),
                child: Expanded(
                  child: GridView.builder(
                    itemCount: 20,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 165,
                            childAspectRatio: 1,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, i) {
                      return InkWell(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.only(
                              left: 5, top: 1, right: 5, bottom: 1),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset:
                                    Offset(0, 1), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 70,
                                child: Image.asset(
                                  "images/car.png",
                                  scale: 1,
                                  fit: BoxFit.cover,
                                  alignment: Alignment.center,
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(left: 10, top: 5),
                                  child: Text(
                                    "Porche",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal),
                                  )),
                              Container(
                                  margin: EdgeInsets.only(left: 10, top: 4),
                                  child: Text(
                                    "911 4s Special",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: MyColors.primaryColor),
                                  )),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


import 'dart:math';

import 'package:car_kuru/models/shopsearch.dart';
import 'package:car_kuru/utils/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../styles/colors.dart';
import '../styles/text_constants.dart';
import '../utils/uri.dart';


class SearchNow extends StatefulWidget {
  @override
  _SearchNowState createState() => _SearchNowState();
}

class _SearchNowState extends State<SearchNow> {

  TextEditingController searchController;
  List<VehicleSearch> searchList = new List<VehicleSearch>();

  String token;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    vehicleSearch(token).then((data) {
      setState(() {

        searchList = data;

        print("searching: ");
        print(searchList);
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        elevation: 3,
        iconTheme: IconThemeData(
          color: MyColors.primaryColor, //change your color here
        ),
        backgroundColor: Colors.white,
        title: Container(
          height: 40,
          color: MyColors.grey,
          padding: EdgeInsets.only(left: 10),
          child: new TextFormField(
            maxLines: 1,
            style: TextStyle(
                fontSize: 16.0, height: 1.0, color: Colors.black),
            controller: searchController,
            onChanged: (String value) async {
              token = value;

              vehicleSearch(token).then((data) {
                setState(() {

                  searchList = data;

                  print("searching: ");
                  print(searchList);
                });
              });

            },
            decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.only(
                    left: 5, right: 10, top: 13, bottom: 0),
                border: InputBorder.none,
                // Added this
                hintText: TConstants.search,
                hintStyle: TextStyle(fontSize: 14)),
          ),
        ),
      ),
      body: SafeArea(
          child: searchList.length ==0 ? Center(
            child: Container(
              child: Text("Search for vehicle",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ),
          ):Container(
            color: MyColors.grey,
            child:  ListView.builder(
              itemCount: searchList.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int i) {
                return Container(
                  color: Colors.white,
                  margin: EdgeInsets.only(bottom: 10),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 15, right: 15, top: 5),
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: MyColors.black.withOpacity(0.8),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)
                          ),
                        ),
                        child: Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Stack(
                              children: <Widget>[
                                Positioned.fill(
                                  child: Image.network(
                                    "$baseUrl${searchList[i].image}",
                                    fit: BoxFit.contain,
                                    alignment: Alignment.topRight,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(searchList[i].title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: MyColors.white),),
                                    Text(searchList[i].address,style: TextStyle(fontSize: 14,color: MyColors.white),),
                                    Text("")
                                  ],
                                ),
                              ],
                            )
                        ),
                      ),
                      ListTile(
                        title: Text("${searchList[i].title} ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.black),),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 5,),
                            Text("${searchList[i].address}",style: TextStyle(fontSize: 12,color: Colors.black),),
                            SizedBox(height: 5,),
                            Row(
                              children: [
                                Icon(Icons.directions_bike_sharp,color: MyColors.primaryColor,size: 14,),
                                SizedBox(width: 5,),
                                Text("Free Delivery",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 12,color: MyColors.primaryColor),),
                              ],
                            ),
                            SizedBox(height: 5,),

                          ],
                        ),



                      )

                    ],
                  ),
                );
              }
            ),
          )
      ),
    );
  }


}

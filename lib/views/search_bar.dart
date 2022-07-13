
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
  List<Shopsearch> searchList = new List<Shopsearch>();

  String token;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    vehicleSearch(token).then((data) {
      setState(() {
        print("result ${searchList.length}");
        if(data != null){
          searchList = data;
          print("searching: ${searchList}");
        }else{
          print("searching: not found");
        }
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
          color: MyColors.white, //change your color here
        ),
        backgroundColor: MyColors.primaryColor,
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
                  print("result ${searchList.length}");
                  if(data != null){
                    searchList = data;
                    print("searching: ${searchList}");
                  }else{
                    print("searching: not found");
                  }

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
              child: Text("Nothing found",style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal),),
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
                        height: 180,
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
                            child: Image.network(
                              "${baseUrl}${searchList[i].image}",
                              fit: BoxFit.cover,
                              alignment: Alignment.center,
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
                            Text("${searchList[i].description}",style: TextStyle(fontSize: 12,color: Colors.black),),
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../styles/colors.dart';
import '../notifications.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  TextEditingController searchController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primaryColor,
        title: Text("Favorite",style: TextStyle(fontSize: 14),),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 10,),
              Container(
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                width: MediaQuery.of(context).size.width -20 ,
                decoration: BoxDecoration(
                    color: MyColors.grey,
                    borderRadius: BorderRadius.circular(10)),
                child: new TextFormField(
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 16.0, height: 1.0, color: Colors.black),
                  controller: searchController,
                  onChanged: (String value) async {},
                  decoration: InputDecoration(
                      isDense: true,
                      prefixIcon: Icon(
                        Icons.search_rounded,
                        color: Colors.black,
                      ),
                      contentPadding: EdgeInsets.only(
                          left: 5, right: 10, top: 16, bottom: 0),
                      border: InputBorder.none,
                      hintText: "Search Now",
                      hintStyle: TextStyle(fontSize: 14)),
                ),
              ),
              SizedBox(height: 10,),
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
                            Spacer(),
                            Icon(Icons.notifications_active,size: 30, color: MyColors.yellow,),
                            SizedBox(width: 10,),
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

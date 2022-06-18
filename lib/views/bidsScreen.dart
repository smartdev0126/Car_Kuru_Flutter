import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../styles/colors.dart';

class BidsScreen extends StatefulWidget {
  const BidsScreen({Key key}) : super(key: key);

  @override
  _BidsScreenState createState() => _BidsScreenState();
}

class _BidsScreenState extends State<BidsScreen> {
  TextEditingController searchController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primaryColor,
        title: Text("Bids",style: TextStyle(fontSize: 14),),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [

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
                        height: 140,
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
                                height: 140,
                                fit: BoxFit.contain,
                                alignment: Alignment.center,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(height: 3,),
                                Text("Toyota Cover Van",textAlign:TextAlign.start,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black),),
                                SizedBox(height: 5,),
                                Text("\$ 9000",textAlign:TextAlign.start,style: TextStyle(fontSize: 14,color: Colors.red,fontWeight: FontWeight.bold),),
                                Row(
                                  children: [
                                    Icon(Icons.verified,size: 15,),
                                    SizedBox(width: 8,),
                                    Text("6 Bids")
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.attach_money_outlined,size: 15,),
                                    SizedBox(width: 8,),
                                    Text("3900 Avg Biding Price")
                                  ],
                                ),
                                SizedBox(height: 3,),
                                Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Text("Your Bidding Price: 2400 \$",style: TextStyle(fontSize:10,color: MyColors.white),)),

                                SizedBox(height: 3,),
                                Row(
                                  children: [
                                    Icon(Icons.timelapse,size: 15,),
                                    SizedBox(width: 8,),
                                    Text("24 hrs left")
                                  ],
                                ),
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

import 'package:car_kuru/utils/api.dart';
import 'package:car_kuru/views/registrationScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../styles/colors.dart';
import '../models/Vehicle.dart';
import '../models/user.dart';
import '../utils/shared_preference.dart';
import '../utils/uri.dart';

class SingleProductScreen extends StatefulWidget {
  int id;
  SingleProductScreen(this.id);

  @override
  _SingleProductScreenState createState() => _SingleProductScreenState();
}

class _SingleProductScreenState extends State<SingleProductScreen> {
  TextEditingController searchController;
  Vehicle vehicle;
  Bids bids;
  bool loading = true;
  Users user;

  final amountController = TextEditingController();

  @override
  void initState() {
    getUser().then((data) {
      setState(() {
        user = data;
      });
    });
    singleVehicle(widget.id).then((data) {
      setState(() {
        vehicle = data;
        loading = false;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: loading == true ?  AppBar(
        backgroundColor: MyColors.primaryColor,
      ): AppBar(
        backgroundColor: MyColors.primaryColor,
        title: Text(
          "${vehicle.vehicle.title}",
          style: TextStyle(fontSize: 14),
        ),
      ),
      body: SingleChildScrollView(
        child: loading ==true ? Container(
          height: MediaQuery.of(context).size.height-60,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Container(
              height: 30,
              width: 30,
              child: CircularProgressIndicator(
                color: MyColors.primaryColor,
              ),
            ),
          ),
        ): Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(
                      "${baseUrl}${vehicle.vehicle.image}",
                      height: 220,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 5, right: 5),
                        padding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                        decoration: BoxDecoration(
                            color: Color(0xFFF8F8F8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 3,
                                blurRadius: 3,
                                offset:
                                    Offset(0, 2), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                bottomRight: Radius.circular(40))),
                        child: Text(
                          "${vehicle.vehicle.price} Yen Biding Price",
                          style: TextStyle(
                              color: MyColors.black,
                              fontWeight: FontWeight.bold),
                        )),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      "Toyota Cover Van",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "Japan",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.verified,
                          size: 15,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text("6 Bids")
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 80,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: MyColors.grey,
                          border: Border.all(width: 1, color: MyColors.yellow)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Description",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${vehicle.vehicle.description}",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: (){
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: Center(child: const Text('Toyota Cover Van',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)),
                            content: ListTile(
                              title:  const Text('Top Bidding Price: 1000\$',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold)),
                              subtitle:  const Text('AVG Bidding Price: 1000\$',style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                            ),
                            actions: <Widget>[
                              TextFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Enter Bid Amount',
                                ),
                                keyboardType: TextInputType.number,
                                controller: amountController,
                              ),
                              SizedBox(height: 10,),
                              Center(
                                child: Container(
                                  padding: const EdgeInsets.only(left: 40,right: 40,bottom: 10,top: 10),
                                  color: MyColors.primaryColor,
                                  child: GestureDetector(
                                    onTap: () {
                                      double amount = double.parse(amountController.value.toString()) ;
                                      vehicle = Vehicle(vehicle: Vehicles(price: amount));
                                      bidVehicle(user,user.id).then((data) {
                                        setState(() {
                                          if (data == 200) {
                                            Fluttertoast.showToast(
                                                msg: "Successfully Bid",
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.CENTER,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor: Colors.red,
                                                textColor: Colors.white,
                                                fontSize: 16.0
                                            );

                                          } else {
                                            Fluttertoast.showToast(
                                                msg: "Failed to bid",
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.CENTER,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor: Colors.red,
                                                textColor: Colors.white,
                                                fontSize: 16.0
                                            );
                                          }
                                        });
                                      });
                                    },
                                    child: const Text('Bid',style: TextStyle(color: Colors.white),),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      child: Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(vertical: 5),
                          margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const <BoxShadow>[
                               BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(1, 2),
                                  blurRadius: 3,
                                  spreadRadius: 2)
                            ],
                            color: MyColors.orange,
                          ),
                          child: const Text(
                            'Bid Now',
                            style: TextStyle(fontSize: 16, color: MyColors.white),
                          )),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.verified,
                          size: 15,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "1 day left 6/15 (Tue) 14:04 Scheduled to end",
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Table(
                border: TableBorder.all(
                  color: Colors.white,
                  style: BorderStyle.solid,
                  width: 0,
                ),
                children: [
                  TableRow(children: [
                    Column(
                        children: [Text('', style: TextStyle(fontSize: 10.0))]),
                    Column(
                        children: [Text('', style: TextStyle(fontSize: 10.0))]),
                    Column(
                        children: [Text('', style: TextStyle(fontSize: 10.0))]),
                    Column(
                        children: [Text('', style: TextStyle(fontSize: 10.0))]),
                  ]),

                  TableRow(children: [
                    Column(children: [
                      Text(
                        'Edition:',style: TextStyle(color: MyColors.primaryColor)
                      )
                    ]),
                    Column(children: [Text('${vehicle.vehicle.edition}')]),
                    Column(children: [
                      Text(
                        'Year:',style: TextStyle(color: MyColors.primaryColor)
                      )
                    ]),
                    Column(children: [Text('${vehicle.vehicle.edition}')]),
                  ]),
                  TableRow(children: [
                    Column(children: [Text('Model:',style: TextStyle(color: MyColors.primaryColor))]),
                    Column(children: [Text('${vehicle.vehicle.model}')]),
                    Column(children: [Text('Transmission:',style: TextStyle(color: MyColors.primaryColor))]),
                    Column(children: [Text('${vehicle.vehicle.transmission == 1? "Auto": "Manual"}')]),
                  ]),
                  TableRow(children: [
                    Column(children: [Text('Fuel Type:',style: TextStyle(color: MyColors.primaryColor))]),
                    Column(children: [Text('${vehicle.vehicle.fuelType == 1? "Auto": "Manual"}')]),
                    Column(children: [Text('Gear:',style: TextStyle(color: MyColors.primaryColor))]),
                    Column(children: [Text('Auto')]),
                  ]),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              // Column(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Container(
              //         margin: EdgeInsets.only(left: 25),
              //         child: Text(
              //           "Similar Products",
              //           style: TextStyle(
              //               fontSize: 14, fontWeight: FontWeight.bold),
              //         )),
              //     Container(
              //       height: MediaQuery.of(context).size.height,
              //       padding: EdgeInsets.only(
              //           left: 20, right: 20, top: 10, bottom: 10),
              //       child: Expanded(
              //         child: GridView.builder(
              //           itemCount: 6,
              //           shrinkWrap: true,
              //           gridDelegate:
              //               const SliverGridDelegateWithMaxCrossAxisExtent(
              //                   maxCrossAxisExtent: 150,
              //                   childAspectRatio: 1,
              //                   crossAxisSpacing: 5,
              //                   mainAxisSpacing: 5),
              //           scrollDirection: Axis.vertical,
              //           itemBuilder: (context, i) {
              //             return InkWell(
              //               onTap: () {},
              //               child: Container(
              //                 margin: EdgeInsets.only(
              //                     left: 5, top: 3, right: 5, bottom: 3),
              //                 decoration: BoxDecoration(
              //                   color: Colors.white,
              //                   boxShadow: [
              //                     BoxShadow(
              //                       color: Colors.grey.withOpacity(0.1),
              //                       spreadRadius: 1,
              //                       blurRadius: 2,
              //                       offset: Offset(
              //                           0, 1), // changes position of shadow
              //                     ),
              //                   ],
              //                 ),
              //                 child: Column(
              //                   mainAxisAlignment: MainAxisAlignment.start,
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: [
              //                     Container(
              //                       width: MediaQuery.of(context).size.width,
              //                       height: 70,
              //                       child: Image.asset(
              //                         "images/car.png",
              //                         scale: 1,
              //                         fit: BoxFit.cover,
              //                         alignment: Alignment.center,
              //                       ),
              //                     ),
              //                     SizedBox(
              //                       height: 2,
              //                     ),
              //                     Container(
              //                         margin: EdgeInsets.only(left: 10, top: 2),
              //                         child: Text(
              //                           "Porche",
              //                           textAlign: TextAlign.start,
              //                           style: TextStyle(
              //                               fontSize: 12,
              //                               color: Colors.black,
              //                               fontWeight: FontWeight.normal),
              //                         )),
              //                     Container(
              //                         margin: EdgeInsets.only(left: 10, top: 0),
              //                         child: Text(
              //                           "911 4s Special",
              //                           textAlign: TextAlign.start,
              //                           style: TextStyle(
              //                               fontSize: 10,
              //                               fontWeight: FontWeight.bold,
              //                               color: MyColors.primaryColor),
              //                         )),
              //                   ],
              //                 ),
              //               ),
              //             );
              //           },
              //         ),
              //       ),
              //     ),
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:core';
import 'package:car_kuru/styles/colors.dart';
import 'package:car_kuru/utils/shared_preference.dart';
import 'package:car_kuru/widget/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:easy_localization/easy_localization.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    getUser().then((data) {
      setState(() {

      });
    });

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
              title: Text(
                "Notifications",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: MyColors.white),
                textAlign: TextAlign.center,
              ).tr(),
            ),
            body: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "All Notifications",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: MyColors.black),
                            ).tr(),
                            InkWell(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (_) {
                                      return MyDialog();
                                    }).then((value) {
                                  print(value);

                                  if (value[tr("All")] ||
                                      value[tr("Pending")] ||
                                      value[tr("On the hub")] ||
                                      value[tr("On the way")] ||
                                      value[tr("Delivered")] ||
                                      value[tr("Cancelled")]) {
                                    // ordersHistory(id).then((data) {
                                    //   setState(() {
                                    //     if (data != null) {
                                    //       orderHistoryList.clear();
                                    //       for (var i = 0;
                                    //           i < data.length;
                                    //           i++) {
                                    //         setState(() {
                                    //           if (value[tr("All")]) {
                                    //             orderHistoryList.add(data[i]);
                                    //           } else {
                                    //             if (value["Pending"] &&
                                    //                 data[i].status == 1) {
                                    //               orderHistoryList.add(data[i]);
                                    //             } else if (value[
                                    //                     tr("On the hub")] &&
                                    //                 data[i].status == 2) {
                                    //               orderHistoryList.add(data[i]);
                                    //             } else if (value[
                                    //                     tr("On the way")] &&
                                    //                 data[i].status == 3) {
                                    //               orderHistoryList.add(data[i]);
                                    //             } else if (value["Delivered"] &&
                                    //                 data[i].status == 4) {
                                    //               orderHistoryList.add(data[i]);
                                    //             } else if (value["Cancelled"] &&
                                    //                 data[i].status == 5) {
                                    //               orderHistoryList.add(data[i]);
                                    //             } else {}
                                    //           }
                                    //         });
                                    //       }
                                    //     } else {
                                    //       print("order history failed");
                                    //     }
                                    //   });
                                    // });
                                  }
                                });
                              },
                              child: Container(
                                width: 100,
                                child: ListTile(
                                  leading: Container(
                                      margin: EdgeInsets.only(top: 5),
                                      child: Text("Filter",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: MyColors.primaryColor))),
                                  title: Icon(
                                    Icons.sort_outlined,
                                    size: 16,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),

                    ],
                  ),
                ))));
  }

  getCustomFormattedDateTime(String givenDateTime, String dateFormat) {
    // dateFormat = 'MM/dd/yy';
    final DateTime docDateTime = DateTime.parse(givenDateTime);
    return DateFormat(dateFormat).format(docDateTime.add(new Duration(hours: 6)));
  }
}

class MyDialog extends StatefulWidget {
  @override
  _MyDialogState createState() => new _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  Map<String, bool> Lists = {
    'All': false,
    'Cancelled': false,
    'Pending': false,
    'On the hub': false,
    'On the way': false,
    'Delivered': false,
  };

  var holder_1 = [];

  getItems() {
    Lists.forEach((key, value) {
      if (value == true) {
        holder_1.add(key);
      }
    });
    print(holder_1);
    holder_1.clear();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Filter',
        textAlign: TextAlign.center,
      ).tr(),
      content: Container(
          height: MediaQuery.of(context).size.height - 300,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: Lists.keys.map((String key) {
                    return CheckboxListTile(
                      title: Text(key),
                      value: Lists[key],
                      activeColor: Colors.deepPurple[400],
                      checkColor: Colors.white,
                      onChanged: (bool value) {
                        setState(() {
                          Lists[key] = value;
                          print("changed");
                        });
                        Lists[key];
                      },
                    );
                  }).toList(),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context, Lists);
                },
                child: Container(
                  child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
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
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Color(0xff5bf4ff), Color(0xff1bb4bd)])),
                      child: Text(
                        'Filter now',
                        style: TextStyle(fontSize: 16, color: MyColors.white),
                      ).tr()),
                ),
              )
            ],
          )),
    );
  }
}

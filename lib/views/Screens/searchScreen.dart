import 'package:car_kuru/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                Icon(
                  Icons.arrow_back,
                  color: MyColors.white,
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

          Container(
            height: 1000,
              child: ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  itemBuilder: (context, i) {
                    return Container(
                      padding: EdgeInsets.all(15),
                      margin: EdgeInsets.only(bottom: 4,left: 10,right: 10),
                      color: MyColors.white,
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Search Results")
                        ],
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}

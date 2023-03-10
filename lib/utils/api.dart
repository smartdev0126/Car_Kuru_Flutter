import 'dart:async';
import 'dart:convert';

import 'package:car_kuru/models/AllVehicle.dart';
import 'package:car_kuru/models/Vehicle.dart';
import 'package:car_kuru/models/shopsearch.dart';
import 'package:car_kuru/utils/shared_preference.dart';
import 'package:car_kuru/utils/uri.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../models/Bid.dart';
import '../models/Brand.dart';
import '../models/user.dart';


Future<List<Users>> login(phone, pass) async {
  String url ='$baseUrl/v0/user/?phone=${phone}&password=${pass}';
  final responseBody = (await http.get(Uri.parse(url)));
  print(responseBody.body);
  if(Users.fromJsonList(jsonDecode(responseBody.body)).length == 0){
    print("Login failed");
    Fluttertoast.showToast(
        msg: "Phone or Password went wrong",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0
    );
    return [];
  }else{
    saveUser(json.encode(Users.fromJsonList(jsonDecode(responseBody.body)).first.toJson()));
    return  Users.fromJsonList(jsonDecode(responseBody.body));
  }

}


Future<int> userCreate(data) async {

  print(data);

  final responseBody = (await http.post(Uri.parse('$baseUrl/v0/user/'),
      body: json.encode(data), headers: {'Content-Type': 'application/json'}));

  print(data);
  print(responseBody.body);

  if (responseBody.statusCode == 201) {
    print("Successfully created user");
  }else {
    print("Failed to submit ${responseBody.statusCode}");
  }
  return responseBody.statusCode;

}


Future<int> profileUpdate(data,id) async {

  final responseBody = (await http.patch(Uri.parse('$baseUrl/v0/user/${id}/'),
      body: json.encode(data), headers: {'Content-Type': 'application/json'}));
  saveUser(responseBody.body);
  print(responseBody.body);

  if (responseBody.statusCode == 200) {
    print("Successfully updated");
  }else {
    print("Failed to submit ${responseBody.statusCode}");
  }
  return responseBody.statusCode;

}


Future<List<AllVehicle>> allVehicles() async {
  String url ='$baseUrl/v0/Vehicle/';
  final responseBody = (await http.get(Uri.parse(url)));

  if(responseBody.body !=null){
    return AllVehicle.fromJsonList(jsonDecode(responseBody.body));
  }else{
    return null;
  }

}

Future<Vehicle> singleVehicle(int id) async {
  String url ='$baseUrl/v0/vehicle/details?id=${id}';
  final responseBody = (await http.get(Uri.parse(url)));

  if(responseBody.body !=null){
    return Vehicle.fromJson(jsonDecode(responseBody.body));
  }else{
    return null;
  }

}


Future<int> bidVehicle(data,id) async {

  final responseBody = (await http.patch(Uri.parse('$baseUrl/v0/vehicle/details?id=${id}'),
      body: json.encode(data), headers: {'Content-Type': 'application/json'}));
  print(responseBody.body);

  if (responseBody.statusCode == 200) {
    print("Successfully bid");
  }else {
    print("Failed to bid ${responseBody.statusCode}");
  }
  return responseBody.statusCode;

}


Future<List<Brand>> allBrands() async {
  String url ='$baseUrl/v0/brand/';
  final responseBody = (await http.get(Uri.parse(url)));

  if(responseBody.body !=null){
    return Brand.fromJsonList(jsonDecode(responseBody.body));
  }else{
    return null;
  }

}

Future<Bid> bids() async {
  String url ='$baseUrl/v0/bid/';
  final responseBody = (await http.get(Uri.parse(url)));

  if(responseBody.body !=null){
    return Bid.fromJson(jsonDecode(responseBody.body));
  }else{
    return null;
  }

}


Future<List<Bid>> userBid(int id) async {
  String url ='$baseUrl/v0/bid/?user=${id}/';
  final responseBody = (await http.get(Uri.parse(url)));

  return Bid.fromJsonList(jsonDecode(responseBody.body));

}


Future<List<Shopsearch>> vehicleSearch(String token) async {
  String url ='$baseUrl/v0/Vehicle/?text=${token}';
  final responseBody = (await http.get(Uri.parse(url)));

  if(responseBody.body !=null){
    return Shopsearch.fromJsonList(jsonDecode(responseBody.body));
  }else{
    return null;
  }

}


Future<List<AllVehicle>> payFrima() async {
  String url ='$baseUrl/v0/Vehicle/?group=3';
  final responseBody = (await http.get(Uri.parse(url)));

  if(responseBody.body !=null){
    return AllVehicle.fromJsonList(jsonDecode(responseBody.body));
  }else{
    return null;
  }

}

Future<List<AllVehicle>> pickupVehicle() async {
  String url ='$baseUrl/v0/Vehicle/?group=3';
  final responseBody = (await http.get(Uri.parse(url)));

  if(responseBody.body !=null){
    return AllVehicle.fromJsonList(jsonDecode(responseBody.body));
  }else{
    return null;
  }

}
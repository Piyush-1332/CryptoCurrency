import 'package:flutter/material.dart';
import './homepage.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

void main(List<String> args) async{
  List currencies = await getCurrency4me();
  runApp(MyApp(currencies));
}

class MyApp extends StatelessWidget{
  final List _currencies;
  MyApp(this._currencies);
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.teal,
        primaryColor: Colors.teal
      ),
      home: new HomePage(_currencies),
    );
  }
}

  Future<List> getCurrency4me() async {
    String cryptoUrl = "https://api.coinmarketcap.com/v1/ticker/?limit=50";
    http.Response response = await http.get(cryptoUrl);
    return json.decode(response.body);
  }
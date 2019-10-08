import 'package:flutter/material.dart';
import 'AppBar.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import '../Serializer/Video.dart';
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    getHttp();
    return Scaffold(
      appBar: createAppBar("uliuli"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

          ],
        ),
      ),
    );
  }


  Dio _dio=Dio();
  Response  _response;

  void getHttp() async{
    _response = await _dio.get("http://www.yoshino.studio:3389/api/v1/video/1");
    Map<String, dynamic> data=json.decode(_response.toString());
    var video=new Video.fromJson(data["data"]);

    print(data);
  }
}
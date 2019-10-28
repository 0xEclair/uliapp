import 'package:dio/dio.dart';
import 'package:uliapp/Serializer/Common.dart';
import 'dart:convert';
import '../Serializer/Common.dart';

// TODO
Future<VideoList> LoginService() async{
  Response  response = await Dio().get("http://192.168.10.120:3000/api/v1/app/user/login");
  Map<String, dynamic> data=json.decode(response.toString());
  var videos=new VideoList.fromJson(data["data"]);
  return videos;
}
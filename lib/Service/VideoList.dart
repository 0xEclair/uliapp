import 'package:dio/dio.dart';
import 'package:uliapp/Serializer/Common.dart';
import 'dart:convert';
import '../Serializer/Common.dart';

Dio dio=Dio();
Response  response;

Future<VideoList> getVideoList() async{
  response = await dio.get("http://www.yoshino.studio:3389/api/v1/videos");
  Map<String, dynamic> data=json.decode(response.toString());
  var videos=new VideoList.fromJson(data["data"]);
  return videos;
}
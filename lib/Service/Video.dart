import 'package:dio/dio.dart';
import 'package:uliapp/Serializer/Common.dart';
import 'dart:convert';
import '../Serializer/Common.dart';

Future<VideoList> getVideoList() async{
  Response  response = await Dio().get("http://www.yoshino.studio:3389/api/v1/videos");
  Map<String, dynamic> data=json.decode(response.toString());
  var videos=new VideoList.fromJson(data["data"]);
  return videos;
}
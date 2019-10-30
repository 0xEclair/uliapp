import 'package:dio/dio.dart';
import 'package:uliapp/Serializer/Common.dart';
import 'dart:convert';
import '../Serializer/Common.dart';
import 'package:uliapp/Serializer/User.dart';
import 'Common.dart';
// TODO
Future<VideoList> LoginService(String user_name,String password) async{
  Response  response = await Dio().post(
      "http://192.168.10.120:3000/api/v1/app/user/login",
      data:{"user_name":user_name,"password":password});
  Map<String, dynamic> data=json.decode(response.toString());
  var videos=new VideoList.fromJson(data["data"]);
  return videos;
}

Future<User> UserInfo(String token)async{
  Response response = await Dio().get(hdr+"/app/user/me");
}
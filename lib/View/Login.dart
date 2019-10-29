import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:provider/provider.dart';
import 'package:uliapp/Model/StorageModel.dart';
class LoginPage extends StatelessWidget{
  @override
  build(BuildContext context){
     return Column(
      children: <Widget>[
        TextField(
          autofocus: true,
          decoration: InputDecoration(
              labelText: "用户名",
              prefixIcon: Icon(Icons.person)
          ),
          controller: _user_name,
        ),
        TextField(
          decoration: InputDecoration(
              labelText: "密码",
              prefixIcon: Icon(Icons.lock)
          ),
          obscureText: true,
          controller: _password,
        ),
        FlatButton(
          color: Colors.blue,
          highlightColor: Colors.blue[700],
          colorBrightness: Brightness.dark,
          splashColor: Colors.grey,
          child:Text("登录"),
          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          onPressed: (){
            _verifyAccount(context);
          },
        )
      ],
    );
  }

  _verifyAccount(BuildContext context) async {
    final storage=Provider.of<StorageModel>(context);
    if(_user_name.text=="" || _password.text==""){
      _createToast("用户名或密码为空，请重试");
      return ;
    }
    Response  response = await Dio().post(
        "http://192.168.10.120:3000/api/v1/app/user/login",
        data:{"user_name":_user_name.text,"password":_password.text});
    if(response.statusCode==null){
      _createToast("用户名或密码错误，请重试");
      return ;
    }

    Map<String, dynamic> data=json.decode(response.toString());
    storage.setToken(data["token"]);
    storage.userModel.online=true;
    _createToast("登陆成功");
  }

  _createToast(String message){
    return Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  TextEditingController _user_name=TextEditingController();
  TextEditingController _password=TextEditingController();
}
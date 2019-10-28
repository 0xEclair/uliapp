import 'package:flutter/material.dart';
import 'package:uliapp/View/Login.dart';
//class userPage{
//  final String token;final callback;
//  userPage({
//    @required this.callback,
//    @required this.token});
//
//  Widget createUserPage(){
//
//    return token!=null?Column(
//      mainAxisAlignment: MainAxisAlignment.center,
//      children: <Widget>[
//        Text("test"),
//      ],
//    ):new loginPage(callback: callback).createLoginPage();
//  }
//}

class UserPage extends StatefulWidget{
  String token;final callback;
  UserPage({
    @required this.token,
    @required this.callback
  });

  @override
  UserState createState(){
    return UserState();
  }
}

class UserState extends State<UserPage>{
  @override
  Widget build(BuildContext context){
    return widget.token!=null?Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("test"),
      ],
    ):new LoginPage(setTokenCb: widget.callback,refreshCb: refresh).createLoginPage();
  }

  refresh(@required String token){
    setState(() {
      widget.token=token;
    });
  }
}
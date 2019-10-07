import 'package:flutter/material.dart';

AppBar createAppBar(String Title){
  return AppBar(
    title:Row(children: <Widget>[
      Stack(children: <Widget>[
        ClipOval(child: Icon(Icons.ac_unit)),
      ]),
      Container(
        margin: EdgeInsets.only(left: 13,right: 13),
        alignment:Alignment.centerLeft,
        width: 170,height: 30,child: Icon(Icons.search),
      )
    ],
    ),
  );
}
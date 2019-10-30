import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:uliapp/Model/StorageModel.dart';

import 'package:uliapp/View/Login.dart';

class User extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final storage=Provider.of<StorageModel>(context);

    return storage.userModel.online?Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("test"),
      ],
    ):new LoginPage();
  }
}
import 'package:flutter/material.dart';
import 'package:uliapp/Model/StorageModel.dart';
import 'View/App.dart';
import 'package:provider/provider.dart';
void main() {
  final storageModel=new StorageModel();
  storageModel.init();
  return runApp(ChangeNotifierProvider.value(
      value: storageModel,
      child: MyApp()
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.pink),
      home: App(title: 'Flutter Demo Home Page')
    );
  }
}



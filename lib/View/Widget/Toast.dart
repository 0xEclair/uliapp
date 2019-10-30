import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

createToast(String message){
  return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIos: 1,
      textColor: Colors.white,
      fontSize: 16.0
  );
}
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'UserModel.dart';

class StorageModel with ChangeNotifier{
  Future<String> getToken(){
    return _storage.read(key: "token");
  }
  setToken(String token){
    _storage.write(key: "token",value: token);
    userModel.token=token;
    userModel.online=true;
    notifyListeners();
  }
  readAll(){
    return _storage.readAll();
  }

  UserModel userModel=new UserModel();
}

final _storage=new FlutterSecureStorage();

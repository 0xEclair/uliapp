import 'package:dio/dio.dart' as hdio;
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'UserModel.dart';
import 'package:uliapp/Service//Common.dart';
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

  init()  {
    Future<String> token = getToken();
    token.then((token)async{
      if(token!=null){
        print(token);
       try{
         hdio.Dio dio=hdio.Dio();
         dio.interceptors.add(
             hdio.InterceptorsWrapper(
             onRequest: (hdio.Options options){
               dio.interceptors.requestLock.lock();
               options.headers={"Authorization":"Bearer $token"};
               dio.interceptors.requestLock.unlock();
             }
           )
         );
         hdio.Response response = await dio.get(hdr+"app/user/ping");
         print("success");
         print(response);
         userModel.token=token;
         userModel.online=true;
       }on hdio.DioError catch (e) {
         print("error");
         print("need to login again");
         // 没登陆只会返回401 这时候因为token失效了
         if(e.response.statusCode==401){
           _storage.delete(key: "token");
           userModel.token=null;
           userModel.online=false;
         }
       }
      }
    });
  }


  UserModel userModel=new UserModel();
}

final _storage=new FlutterSecureStorage();

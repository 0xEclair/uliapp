
class Response {
  int status;
  DataList data;
  String msg;
  String error;

//  Response.fromJson(Map<String,dynamic> json):
//        status=json["status"],
//        data=json["data"],
//        msg=json["msg"],
//        error=json["error"];

}

class DataList{
  var items;
  int total;

//  DataList.fromJson(Map<String,dynamic> json):
}


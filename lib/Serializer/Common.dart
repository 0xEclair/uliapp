import 'Video.dart';
class _Response {
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

class VideoList{
  List<Video> items;
  int total;

  VideoList({this.items,this.total});

  factory VideoList.fromJson(Map<String,dynamic> json){
    //final list=json["items"] as List;
    List<Video> video_list=(List.from(json["items"])).map(
            (value){
              return Video.fromJson(value);
            }).toList();
//     equal ->
//     List<Video> video_list=(List.from(json["items"])).map(
//            (value)=>Video.fromJson(value);
//        ).toList();
    return VideoList(items:video_list,total:json["total"]);
  }

}

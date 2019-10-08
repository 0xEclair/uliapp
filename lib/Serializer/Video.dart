import 'User.dart';
class Video{
  int id;
  String title;
  String info;
  String url;
  String avatar;
  int view;
  User user;
  int createdAt;

  Video(this.id,this.title,this.info,this.url,this.avatar,this.view,this.user,this.createdAt);

  Video.fromJson(Map<String,dynamic> json):
        id=json["id"],
        title=json["title"],
        info=json["info"],
        url=json["url"],
        avatar=json["avatar"],
        view=json["view"],
        user=User.fromJson(json["user"]),
        createdAt=json["created_at"];

}
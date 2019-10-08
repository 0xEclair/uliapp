
class User{
  int id;
  String userName;
  String nickName;
  String status;
  String avatar;
  int createdAt;

  User(this.id,this.userName,this.nickName,this.status,this.avatar,this.createdAt);

  User.fromJson(Map<String,dynamic> json):
        userName=json["user_name"],nickName=json["nickname"],
        id=json["id"],status=json["status"],avatar=json["avatar"],
        createdAt=json["created_at"];

  Map<String,dynamic> toJson() => <String,dynamic>{
    'id':id,
    "user_name":userName,
    "nickname":nickName,
    "status":status,
    "avatar":avatar,
    "created_at":createdAt
  };
}

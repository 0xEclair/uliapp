import 'package:flutter/material.dart';
class bottomNavigation extends StatelessWidget{
  @override
  build(context){
    return BottomNavigationBar(
      items: [
        createItem(Icons.home, "首页"),
        createItem(Icons.message, "消息"),
        createItem(Icons.person, "个人资料"),
        createItem(Icons.add, "投稿"),
      ],
      showUnselectedLabels: true
    );
  }


}


createItem(IconData view,String name){
  return BottomNavigationBarItem(
    icon:Icon(view,color: Colors.grey),
    title:Text(name,style: TextStyle(color: Colors.grey)),
  );
}
import 'package:flutter/material.dart';
class bottomNavigation extends StatelessWidget{
  @override
  build(context){
    return BottomNavigationBar(
      items: [
        _createItem(Icons.home, "首页"),
        _createItem(Icons.message, "消息"),
        _createItem(Icons.person, "个人资料"),
        _createItem(Icons.add, "投稿"),
      ],
      showUnselectedLabels: true
    );
  }

  _createItem(IconData view,String name){
    return BottomNavigationBarItem(
      icon:Icon(view,color: Colors.grey),
      title:Text(name,style: TextStyle(color: Colors.grey)),
    );
  }
}
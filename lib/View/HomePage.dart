import 'package:flutter/material.dart';

Widget HomePage(List<Widget> videoList){
  return Column(
    children: <Widget>[
      Flexible(
        child: GridView(
          scrollDirection: Axis.vertical,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 1),
          children: videoList==null?
          <Widget>[Image(image: NetworkImage("https://uliuli.oss-cn-hongkong.aliyuncs.com/TIM%E5%9B%BE%E7%89%8720181009201132.png"))]:
          List.generate(videoList.length, (index){
            return videoList[index];
          }),
        ),
      )
    ],
  );
}

Widget Message(){
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Flexible(
        child: Text("Message Page Test"),
      )
    ],
  );
}
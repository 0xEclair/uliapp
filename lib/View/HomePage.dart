import 'package:flutter/material.dart';
import 'AppBar.dart';
import 'dart:ui';
import '../Serializer/Common.dart';
import '../Service/VideoList.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState(){
    _video_list=List<Widget>();
    gridVideo();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar("uliuli"),
      body: GridView(
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 1),
        children: _video_list==null?
          <Widget>[Image(image: NetworkImage("https://uliuli.oss-cn-hongkong.aliyuncs.com/TIM%E5%9B%BE%E7%89%8720181009201132.png"))]:
          List.generate(_video_list.length, (index){
            return _video_list[index];
          }),
      )
    );
  }


  void gridVideo() async{
    VideoList  _videoList=await getVideoList();
    for(int i=0;i<_videoList.total;++i){
      _video_list.add(conVideo(_videoList.items[i].title, _videoList.items[i].avatar));
    }
    setState(() {

    });
  }
  conVideo(String title,String uri){
    return Container(
      child:Column(
        children: <Widget>[
          Image(
            image: NetworkImage(uri),
            height: MediaQueryData.fromWindow(window).size.width/2.5,
          ),
          Text(title)
        ],
      ),
    );
  }

  List<Widget> _video_list;
}


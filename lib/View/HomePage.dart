import 'package:flutter/material.dart';
import 'package:uliapp/View/DisplayVideo.dart';
import 'AppBar.dart';
import 'dart:ui';
import 'package:uliapp/Serializer/Common.dart';
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
      body: Column(
        children: <Widget>[
          Flexible(
            child: GridView(
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 1),
              children: _video_list==null?
              <Widget>[Image(image: NetworkImage("https://uliuli.oss-cn-hongkong.aliyuncs.com/TIM%E5%9B%BE%E7%89%8720181009201132.png"))]:
              List.generate(_video_list.length, (index){
                return _video_list[index];
              }),
            ),
          )
        ],
      )
    );
  }


  void gridVideo() async{
    VideoList  _videoList=await getVideoList();
    for(int i=0;i<_videoList.total;++i){
      _video_list.add(videoCard(_videoList.items[i].title, _videoList.items[i].avatar,_videoList.items[i].url));
    }
    setState(() {

    });
  }
  videoCard(String title,String uri,String video_url){
    return InkWell(
      child:Column(
        children: <Widget>[
          Image(
            image: NetworkImage(uri),
            height: MediaQueryData.fromWindow(window).size.width/2.5,
          ),
          Text(title)
        ],
      ),
      onTap:(){
        Navigator.push(
            context,
            // MaterialPageRoute继承自PageRoute类，
            // PageRoute类是一个抽象类，表示占有整个屏幕空间的一个模态路由页面，
            MaterialPageRoute(builder:(context)=>watchVideo(video_address: video_url))
        );
      },
    );
  }

  List<Widget> _video_list;
}


class newRoute extends StatelessWidget{
  build(BuildContext context){
    return Scaffold(
      appBar: createAppBar("route"),
      body: Center(
        child: Text("This is new route"),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:uliapp/View/DisplayVideo.dart';
import 'AppBar.dart';
import 'dart:ui';
import 'package:uliapp/Serializer/Common.dart';
import '../Service/VideoList.dart';
import 'NavigationBarWidget.dart';
import 'HomePage.dart';
class App extends StatefulWidget {
  App({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState(){
    _initCache();
    _video_list=List<Widget>();
    initVideoList();
    _pages=List<Widget>();
    _pages.add(Text(""));

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar("uliuli"),
      body: _pages.length==1?_pages[0]:_pages[_current_index+1],
      bottomNavigationBar: BottomNavigationBar(
          items: [
            createItem(Icons.home, "首页"),
            createItem(Icons.add, "投稿"),
            createItem(Icons.message, "消息"),
            createItem(Icons.person, "个人资料"),
          ],
          showUnselectedLabels: true,
        currentIndex: _current_index,
        onTap: (int index){
            setState(() {
              _current_index=index;
            });
        },
      )
    );
  }


  void initVideoList() {
    Future<VideoList>  data=getVideoList();
    data.then((_videoList){
        for(int i=0;i<_videoList.total;++i){
          _video_list.add(videoCard(_videoList.items[i].title, _videoList.items[i].avatar,_videoList.items[i].url));
        }

        setState(() {
          _pages.add(HomePage(_video_list));
          _pages.add(Message());
//          _pages.add();
      });
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
      borderRadius: BorderRadius.circular(20),
    );
  }
  List<Widget> _pages;
  List<Widget> _video_list;
  int _current_index=0;

  final storage=new FlutterSecureStorage();
  _initCache() async {
    Map<String, String> allValues = await storage.readAll();
    String value = await storage.read(key: "token");
    if(value==null)value="123";
  }
}
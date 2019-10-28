import 'package:flutter/material.dart';
import 'package:uliapp/View/AppBar.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class OpenVideo extends StatefulWidget{
  String video_address;
  OpenVideo({
    Key key,
    @required this.video_address}):super (key:key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return OpenVideoState();
  }
}

class OpenVideoState extends State<OpenVideo>{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    video_player_=VideoPlayerController.network(widget.video_address);
    chewie_player_=ChewieController(
      videoPlayerController: video_player_,
      aspectRatio: 3/2,
      autoPlay:false,
      looping: false,
      autoInitialize: true
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: createAppBar("video"),
      body: Column(
        children: <Widget>[
          Chewie(controller: chewie_player_,)
        ],
      ),
    );
  }
  @override
  void dispose(){
    video_player_.dispose();
    chewie_player_.dispose();
    super.dispose();
  }
  VideoPlayerController video_player_;
  ChewieController chewie_player_;
}
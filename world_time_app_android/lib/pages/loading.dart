import 'package:flutter/material.dart';
import 'package:world_time_app_android/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async{
    WorldTime instance=WorldTime(location: 'Baku',flag: 'baku.png',url: 'Asia/Baku');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments:{
       'time':instance.time,
       'location':instance.location,
       'flag':instance.flag,
       'isdayTime':instance.isdayTime,
    });
  }
  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[900],
      body: Center(
        child: SpinKitPumpingHeart(
          color: Colors.blue,
          size: 150.0,
        ),
      ),
    );
  }
}

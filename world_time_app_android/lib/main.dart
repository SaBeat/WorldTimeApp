import 'package:flutter/material.dart';
import 'package:world_time_app_android/pages/choose_location.dart';
import 'package:world_time_app_android/pages/home.dart';
import 'package:world_time_app_android/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    //initialRoute: '/home',
    routes: {
      '/':(context)=>Loading(),
      '/home':(context)=>Home(),
      '/location':(context)=>ChooseLocation(),
    },
  ),
  );
}

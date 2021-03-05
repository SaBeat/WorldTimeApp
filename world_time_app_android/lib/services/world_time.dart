import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime{
  String location;
  String time;
  String flag;
  String url;
  bool isdayTime;

  WorldTime({this.flag,this.location,this.time,this.url});
  Future<void> getTime() async {

  try{
  Response response =await get('http://worldtimeapi.org/api/timezone/$url');
  Map data = jsonDecode(response.body);

  String datetime=data['datetime'];
  String offset=data['utc_offset'].substring(0,3);

  DateTime now=DateTime.parse(datetime);
  now=now.add(Duration(hours:int.parse(offset)));

  isdayTime = now.hour>6 && now.hour<20 ? true : false;
  time=DateFormat.jm().format(DateTime.now());
  }
  catch(e){
    print('Caught the error: $e');
    time='Error is not find';
  }


  }

}

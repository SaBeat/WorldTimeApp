import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);

    String bgImage=data['isdayTime'] ? 'day.jpg' : 'night.jpg';
    Color bgColor=data['isdayTime'] ? Colors.blue : Colors.indigo[700];
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,120,0,0),
            child: Column(
              children: [
                FlatButton.icon(
                  onPressed: () async{
                    dynamic result =await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data={
                      'time':result['time'],
                       'location':result['location'],
                       'isdayTime':result['isdayTime'],
                       'flag':result['flag'],
                      };
                    },);
                  },
                  icon: Icon(Icons.edit_location,color: Colors.white,),
                  label: Text(
                    'Edit Location',
                    style: TextStyle(fontSize: 20,color: Colors.white),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                        color:Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  data['time'],
                  style: TextStyle(
                    color:Colors.white,
                    fontSize: 60,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

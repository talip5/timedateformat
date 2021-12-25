import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  DateTime now = DateTime.now();
  DateTime secilenTarih = DateTime.now();
  TimeOfDay secilenSaat = TimeOfDay.fromDateTime(DateTime.now());
  //String formattedDate = DateFormat('kk:mm:ss \n EEE d MMM').format(now);


  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  int isStopped=0;
  intFormat(){
    DateTime secilenTarih = DateTime.now();
    //var f = new NumberFormat("###.00#", "en_US");
    var f = new NumberFormat("00");
    //print(f.format(1));
    //String time5=secilenSaat.minute.toString();
    Timer.periodic(Duration(seconds: 1), (timer) {
      DateTime secilenTarih = DateTime.now();
      if (isStopped<3) {
        int time1=secilenTarih.second;
        String timex= f.format(time1);
        print(timex);
        //timer.cancel();
      }
    });
  }

  @override
  void initState() {
    intFormat();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Clock",style: TextStyle(fontSize: 25.0),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            date(),
            Text(
              "",
              style: TextStyle(fontSize: 50.0),
            ),
            Text(
              now.hour.toString()+':'+now.minute.toString()+':'+now.second.toString(),
              style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
            ),
            Text(
              "",
              style: TextStyle(fontSize: 100.0),
            ),
            Text(secilenSaat.minute.toString(),style: TextStyle(fontSize: 30.0),),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            _incrementCounter();
          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget date() {
    return Text(
      now.day.toString() +
          " / " +
          now.month.toString() +
          " / " +
          now.year.toString(),
      style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
    );
  }
}
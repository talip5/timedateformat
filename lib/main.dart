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

  Timer? _timer;
  String greeting='';

  intFormat(){
    DateTime secilenTarih = DateTime.now();
    //var f = new NumberFormat("###.00#", "en_US");
    var f = new NumberFormat("00");
    //print(f.format(1));
    //String time5=secilenSaat.minute.toString();
    /*Timer.periodic(Duration(seconds: 1), (timerW) {
      DateTime secilenTarih = DateTime.now();
      if (isStopped<=25) {
        int time1=secilenTarih.second;
        String timex= f.format(time1);
        print(timex);
        isStopped++;
      }else{
        timerW.cancel();
      }
      if(timerW.isActive){
        print('timerW is active');
      }
      if(timerW){
        print('timerW is active');
      }
    });*/
    Timer.run(() => print('hi!'));
    Timer.periodic(Duration(seconds: 1), (timer) {
      print('secand');
      if(isStopped==5){
        timer.cancel();
      }
      isStopped++;
    });

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
       greeting = "After Some time ${DateTime.now().second}";
      });
      if(DateTime.now().second==15){
        timer.cancel();
      }
    });

    var today = new DateTime.now();
    print(today);
    var fiftyDaysFromNow = today.add(new Duration(seconds: 360));
    print(fiftyDaysFromNow);
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
            SizedBox(height: 50.0,),
            Text(greeting),
            ElevatedButton(
                onPressed:(){
                  _timer!.cancel();
                },
                child: Text('Stop'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            //_incrementCounter();
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
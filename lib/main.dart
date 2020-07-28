import 'package:flutter/material.dart';
import 'alarm_card.dart';

void main() => runApp(MaterialApp(
      home: JackCard(),
    ));

class JackCard extends StatefulWidget {
  @override
  _JackCardState createState() => _JackCardState();
}

class _JackCardState extends State<JackCard> {
  List<AlarmCard> alarms = [
    AlarmCard(date: "25/07/2020", shiftStart: "09:00", shiftEnd: "15:30"),
    AlarmCard(date: "26/07/2020", shiftStart: "09:00", shiftEnd: "17:00"),
    AlarmCard(date: "27/07/2020", shiftStart: "11:00", shiftEnd: "18:00")
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> alarmls = List();
    for (var i = 0; i < alarms.length; i++) {
      alarmls.add(makeAlarm(alarms[i]));
      alarmls.add(SizedBox(
        height: 20,
      ));
    }
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      appBar: AppBar(
        title: Text("Jack's First App"),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 40, 30, 40),
        child: Column(children: alarmls),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_alarm),
        backgroundColor: Colors.cyanAccent[500],
        onPressed: () {
          setState(() {
            alarms.add(AlarmCard(
                date: "28/07/2020", shiftEnd: "14:00", shiftStart: "07:00"));
          });
        },
      ),
    );
  }

  Widget makeAlarm(AlarmCard alarm) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Column(
          children: <Widget>[
            Text(
              'Date',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 1.5,
              ),
            ),
            Text(
              '${alarm.date}',
              style: TextStyle(
                color: Colors.greenAccent,
                letterSpacing: 1.5,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Column(
          children: <Widget>[
            Text(
              'Shift Start',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 1.5,
              ),
            ),
            Text(
              '${alarm.shiftStart}',
              style: TextStyle(
                color: Colors.greenAccent,
                letterSpacing: 1.5,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Column(
          children: <Widget>[
            Text(
              'Shift End',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 1.5,
              ),
            ),
            Text(
              '${alarm.shiftEnd}',
              style: TextStyle(
                color: Colors.greenAccent,
                letterSpacing: 1.5,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

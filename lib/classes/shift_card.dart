import 'package:flutter/material.dart';

class ShiftCard {
  String date;
  String shiftStart;
  String shiftEnd;
  int day;
  int month;
  int year;

  ShiftCard({this.shiftStart, this.shiftEnd, this.date}) {
    this.date = date;
    this.shiftStart = shiftStart;
    this.shiftEnd = shiftEnd;
    this.day = int.parse(date.split("/")[0]);
    this.month = int.parse(date.split("/")[1]);
    this.year = int.parse(date.split("/")[2]);
  }
  double getShiftLength() {
    int startH = int.parse(this.shiftStart.substring(0, 2));
    int startM = int.parse(this.shiftStart.substring(3, 5));
    int endH = int.parse(this.shiftEnd.substring(0, 2));
    int endM = int.parse(this.shiftEnd.substring(3, 5));
    if (this.isOvernight()) {
      // double shiftLen = ((endH - startH) * 60 + (endM - startM)) / 60;
      return (((24 - startH) + endH) * 60 + (endM - startM)) / 60;
    } else {
      // double shiftLen = (((24 - startH) + endH) * 60 + (endM - startM)) / 60;
      return ((endH - startH) * 60 + (endM - startM)) / 60;
    }
    // return shiftLen;
  }

  bool isOvernight() {
    int startH = int.parse(this.shiftStart.substring(0, 2));
    int endH = int.parse(this.shiftEnd.substring(0, 2));
    if (endH < startH) {
      return true;
    } else {
      return false;
    }
  }

  DateTime genDateTime() {
    return DateTime(this.year, this.month, this.day);
  }

  Widget makeShift() {
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
              '${this.date}',
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
              '${this.shiftStart}',
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
              '${this.shiftEnd}',
              style: TextStyle(
                color: Colors.greenAccent,
                letterSpacing: 1.5,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Column(children: <Widget>[
          FlatButton(
            child: Icon(
              Icons.delete,
              color: Colors.red,
            ),
            onPressed: null,
          )
        ])
      ],
    );
  }
}
// example of how to use AlarmCard note the named variables
// AlarmCard firstalarm =
//     AlarmCard(shiftStart: "9:00", shiftEnd: "15:30", date: "25/07/2020");

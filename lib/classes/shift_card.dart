import 'package:flutter/material.dart';

class ShiftCard {
  String date;
  String shiftStart;
  String shiftEnd;

  ShiftCard({String shiftStart, String shiftEnd, String date}) {
    this.date = date;
    this.shiftStart = shiftStart;
    this.shiftEnd = shiftEnd;
  }
  double getShiftLength() {
    int startH = int.parse(this.shiftStart.substring(0, 2));
    int startM = int.parse(this.shiftStart.substring(2, 5));
    int endH = int.parse(this.shiftEnd.substring(0, 2));
    int endM = int.parse(this.shiftEnd.substring(2, 5));
    if (this.isOvernight()) {
      // double shiftLen = ((endH - startH) * 60 + (endM - startM)) / 60;
      return ((endH - startH) * 60 + (endM - startM)) / 60;
    } else {
      // double shiftLen = (((24 - startH) + endH) * 60 + (endM - startM)) / 60;
      return (((24 - startH) + endH) * 60 + (endM - startM)) / 60;
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
      ],
    );
  }
}
// example of how to use AlarmCard note the named variables
// AlarmCard firstalarm =
//     AlarmCard(shiftStart: "9:00", shiftEnd: "15:30", date: "25/07/2020");

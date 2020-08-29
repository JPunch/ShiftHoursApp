import 'package:flutter/material.dart';

class ShiftCard extends StatelessWidget {
  DateTime date;
  String displayDate;
  String shiftStart;
  String shiftEnd;
  ShiftCard({this.displayDate, this.shiftStart, this.shiftEnd, this.date});

  double getShiftLength() {
    int startH = int.parse(this.shiftStart.substring(0, 2));
    int startM = int.parse(this.shiftStart.substring(3, 5));
    int endH = int.parse(this.shiftEnd.substring(0, 2));
    int endM = int.parse(this.shiftEnd.substring(3, 5));
    if (this.isOvernight()) {
      return (((24 - startH) + endH) * 60 + (endM - startM)) / 60;
    } else {
      return ((endH - startH) * 60 + (endM - startM)) / 60;
    }
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

  TextStyle header = TextStyle(
    color: Colors.grey,
    letterSpacing: 1.5,
  );

  TextStyle content = TextStyle(
    color: Colors.greenAccent,
    letterSpacing: 1.5,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Column(
          children: <Widget>[
            Text(
              'Date',
              style: header,
            ),
            Text('${this.displayDate}', style: content),
          ],
        ),
        Column(
          children: <Widget>[
            Text('Shift Start', style: header),
            Text('${this.shiftStart}', style: content),
          ],
        ),
        Column(
          children: <Widget>[
            Text('Shift End', style: header),
            Text('${this.shiftEnd}', style: content),
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
// example of how to use ShiftCard note the named variables
// ShiftCard firstShift =
//     ShiftCard(shiftStart: "9:00", shiftEnd: "15:30", date: "25/07/2020");

import 'package:flutter/material.dart';
import 'package:test_flutter_app/pages/details.dart';
import 'package:test_flutter_app/pages/calculation.dart';
import 'classes/shift_card.dart';
import 'pages/home.dart';

Map data = {
  "shiftls": [
    // dummy shifts
    ShiftCard(
        displayDate: "25/07/2020",
        shiftStart: "09:00",
        shiftEnd: "15:30",
        date: DateTime(2020, 07, 25)),
    ShiftCard(
        displayDate: "26/07/2020",
        shiftStart: "09:00",
        shiftEnd: "17:00",
        date: DateTime(2020, 07, 26)),
    ShiftCard(
        displayDate: "27/07/2020",
        shiftStart: "11:00",
        shiftEnd: "18:00",
        date: DateTime(2020, 07, 27))
  ]
};
void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/": (context) => Home(),
      "/calculation": (context) => Calculation(), //shifts: data["shiftls"]
      "/details": (context) => Details()
    },
  ));
}

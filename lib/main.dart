import 'package:flutter/material.dart';
import 'package:test_flutter_app/home.dart';
import 'package:test_flutter_app/profile.dart';
import 'package:test_flutter_app/calculation.dart';
import 'shift_card.dart';

List<ShiftCard> shiftls = [
  // dummy shifts
  ShiftCard(date: "25/07/2020", shiftStart: "09:00", shiftEnd: "15:30"),
  ShiftCard(date: "26/07/2020", shiftStart: "09:00", shiftEnd: "17:00"),
  ShiftCard(date: "27/07/2020", shiftStart: "11:00", shiftEnd: "18:00")
];
void main() {
  print("$shiftls");
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => JackCard(shifts: shiftls),
      //   (shifts: shiftls,
      // ),
      '/profile': (context) => Profile(),
      '/calculation': (context) => Calculation(),
    },
  ));
}

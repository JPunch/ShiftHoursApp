import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class AlarmCard {
  String date;
  String shiftStart;
  String shiftEnd;

  AlarmCard({String shiftStart, String shiftEnd, String date}) {
    this.date = date;
    this.shiftStart = shiftStart;
    this.shiftEnd = shiftEnd;
  }
  double getShiftLength() {
    int, int start = int.parse(this.shiftStart.substring(0,2)), int.parse(this.shiftStart.substring(2:5);
    int end = int.parse(this.shiftEnd.substring(0,2));

    return shiftLen
  }

}
// example of how to use AlarmCard note the named variables
// AlarmCard firstalarm =
//     AlarmCard(shiftStart: "9:00", shiftEnd: "15:30", date: "25/07/2020");
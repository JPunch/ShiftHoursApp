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
    int startH = int.parse(this.shiftStart.substring(0, 2));
    int startM = int.parse(this.shiftStart.substring(2, 5));
    int endH = int.parse(this.shiftEnd.substring(0, 2));
    int endM = int.parse(this.shiftEnd.substring(2, 5));
    return null; //shiftLen

    bool isOvernight() {
      int startH = int.parse(this.shiftStart.substring(0, 2));
      int endH = int.parse(this.shiftEnd.substring(0, 2));
      if (endH < startH) {
        return true;
      } else {
        return false;
      }
    }
  }
}
// example of how to use AlarmCard note the named variables
// AlarmCard firstalarm =
//     AlarmCard(shiftStart: "9:00", shiftEnd: "15:30", date: "25/07/2020");

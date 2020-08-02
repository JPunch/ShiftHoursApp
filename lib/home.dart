import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'shift_card.dart';

class JackCard extends StatefulWidget {
  List<ShiftCard> shifts;
  JackCard({Key key, @required this.shifts}) : super(key: key);
  @override
  _JackCardState createState() => _JackCardState(shifts);
}

class _JackCardState extends State<JackCard> {
  List<ShiftCard> shifts;
  _JackCardState(this.shifts);
  // List<ShiftCard> shifts = [
  //   // dummy shifts
  //   ShiftCard(date: "25/07/2020", shiftStart: "09:00", shiftEnd: "15:30"),
  //   ShiftCard(date: "26/07/2020", shiftStart: "09:00", shiftEnd: "17:00"),
  //   ShiftCard(date: "27/07/2020", shiftStart: "11:00", shiftEnd: "18:00")
  // ];
  final TextStyle navbar = TextStyle(
      fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white70);

  @override
  Widget build(BuildContext context) {
    print("second page made it brah");
    List<Widget> shiftls = List();
    for (var i = 0; i < widget.shifts.length; i++) {
      shiftls.add(widget.shifts[i].makeShift());
      shiftls.add(SizedBox(
        height: 20,
      ));
    }
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      appBar: AppBar(
        title: Text("Shifts Hours Pay"),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 40, 30, 40),
        child: Column(children: shiftls),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 20,
        unselectedFontSize: 20,
        iconSize: 30,
        unselectedItemColor: Colors.white70,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.schedule), title: Text("Shifts")),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance), title: Text("Pay")),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), title: Text("Profile"))
        ],
        backgroundColor: Colors.grey[850],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_alarm),
        backgroundColor: Colors.cyanAccent[500],
        onPressed: () {
          shiftPicker();
        },
      ),
    );
  }

  void shiftPicker() async {
    String _date;
    String _shiftStart;
    String _shiftEnd;
    print("picky shifty");
    await DatePicker.showDatePicker(
      context,
      theme: DatePickerTheme(),
      showTitleActions: true,
      currentTime: DateTime.now(),
      onConfirm: (date) {
        _date = "${date.day}/${date.month}/${date.year}";
      },
    );
    await DatePicker.showTimePicker(
      context,
      showTitleActions: true,
      showSecondsColumn: false,
      currentTime: DateTime.now(),
      onConfirm: (time) {
        _shiftStart = time.toString().substring(11, 16);
      },
    );
    await DatePicker.showTimePicker(
      context,
      showTitleActions: true,
      showSecondsColumn: false,
      currentTime: DateTime.now(),
      onConfirm: (time) {
        _shiftEnd = time.toString().substring(11, 16);
      },
    );
    setState(() {
      widget.shifts.add(
          ShiftCard(date: _date, shiftEnd: _shiftEnd, shiftStart: _shiftStart));
    });
  }
}

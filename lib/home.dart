import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'shift_card.dart';

void main() => runApp(MaterialApp(
      home: JackCard(),
    ));

class JackCard extends StatefulWidget {
  @override
  _JackCardState createState() => _JackCardState();
}

class _JackCardState extends State<JackCard> {
  List<ShiftCard> shifts = [
    ShiftCard(date: "25/07/2020", shiftStart: "09:00", shiftEnd: "15:30"),
    ShiftCard(date: "26/07/2020", shiftStart: "09:00", shiftEnd: "17:00"),
    ShiftCard(date: "27/07/2020", shiftStart: "11:00", shiftEnd: "18:00")
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> shiftls = List();
    for (var i = 0; i < shifts.length; i++) {
      shiftls.add(makeShift(shifts[i]));
      shiftls.add(SizedBox(
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
        child: Column(children: shiftls),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.schedule), title: Text("Shifts")),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance), title: Text("Pay")),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), title: Text("Profile"))
        ],
        backgroundColor: Colors.deepPurpleAccent[900],
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

  Widget makeShift(ShiftCard shift) {
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
              '${shift.date}',
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
              '${shift.shiftStart}',
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
              '${shift.shiftEnd}',
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
      shifts.add(
          ShiftCard(date: _date, shiftEnd: _shiftEnd, shiftStart: _shiftStart));
    });
  }
}

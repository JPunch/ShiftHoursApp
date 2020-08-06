import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'shift_card.dart';
import 'package:fluttertoast/fluttertoast.dart';

class JackCard extends StatefulWidget {
  List<ShiftCard> shifts;
  JackCard({Key key, @required this.shifts}) : super(key: key);
  @override
  _JackCardState createState() => _JackCardState(shifts);
}

class _JackCardState extends State<JackCard> {
  List<ShiftCard> shifts;
  _JackCardState(this.shifts);

  final TextStyle temp =
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    // print("second page made it brah");
    List<Widget> shiftls = List();
    for (var i = 0; i < widget.shifts.length; i++) {
      shiftls.add(widget.shifts[i].makeShift());
      shiftls.add(SizedBox(
        height: 20,
      ));
    }
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 40, 30, 40),
        child: Column(children: shiftls),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.add_alarm),
        label: Text(
          "Add Shift",
          style: temp,
        ),
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
    // print("picky shifty");
    makeToast("Select date of shift");
    await DatePicker.showDatePicker(
      context,
      theme: DatePickerTheme(),
      showTitleActions: true,
      currentTime: DateTime.now(),
      onConfirm: (date) {
        if (date.day.toString().length == 1) {
          _date = "0${date.day}/${date.month}/${date.year}";
        } else {
          _date = "${date.day}/${date.month}/${date.year}";
        }
      },
    );
    makeToast("Select shift start time");
    await DatePicker.showTimePicker(
      context,
      showTitleActions: true,
      showSecondsColumn: false,
      currentTime: DateTime.now(),
      onConfirm: (time) {
        _shiftStart = time.toString().substring(11, 16);
      },
    );
    makeToast("Select shift end time");

    await DatePicker.showTimePicker(
      context,
      showTitleActions: true,
      showSecondsColumn: false,
      currentTime: DateTime.now(),
      onConfirm: (time) {
        _shiftEnd = time.toString().substring(11, 16);
      },
    );
    if (_date == null) {
      dateErrorMessage();
    } else if (_shiftStart == null) {
      dateErrorMessage();
    } else if (_shiftEnd == null) {
      dateErrorMessage();
    } else {
      setState(() {
        widget.shifts.add(ShiftCard(
            date: _date, shiftEnd: _shiftEnd, shiftStart: _shiftStart));
      });
    }
  }

  Future<void> dateErrorMessage() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Shift picker alert"),
            content: const Text(
                "Please fill in all date and time fields to add a shift"),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Ok"))
            ],
          );
        });
  }

  Future<bool> makeToast(String label) {
    return Fluttertoast.showToast(
        msg: "$label",
        toastLength: Toast.LENGTH_LONG,
        fontSize: 20,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.cyanAccent[500],
        timeInSecForIosWeb: 3);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:test_flutter_app/main.dart';
import '../classes/shift_card.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Home extends StatefulWidget {
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
  Home({Key key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState(data["shiftls"]);
}

class _HomeState extends State<Home> {
  List<ShiftCard> shifts;
  _HomeState(this.shifts);

  final TextStyle temp =
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white);
  final TextStyle header = TextStyle();

  @override
  Widget build(BuildContext context) {
    // print("second page made it brah");
    List<Widget> shiftls = List();
    shiftls.add(SizedBox(height: 20));
    for (var i = 0; i < shifts.length; i++) {
      shiftls.add(SizedBox(
        height: 20,
      ));
      shiftls.add(shifts[i]);
    }
    // print(shiftls);
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      body: Padding(
          padding: EdgeInsets.fromLTRB(30, 40, 30, 40),
          child: Column(
              children: wrap(
                  Row(
                    children: [
                      Expanded(
                        child: FlatButton.icon(
                            onPressed: () async {
                              Navigator.pushNamed(context, "/calculation",
                                  arguments: data);
                              //go to calculation page maybe await response
                            },
                            icon: Icon(
                              Icons.account_balance_sharp,
                              color: Colors.white,
                              size: 40,
                            ),
                            label: Text(
                              "Pay",
                              style: temp,
                            )),
                      ),
                      Expanded(
                        child: FlatButton.icon(
                            onPressed: () async {
                              Navigator.pushNamed(context, "/details");
                              //go to details page and await response to add details to map
                            },
                            icon: Icon(
                              Icons.account_circle_sharp,
                              color: Colors.white,
                              size: 40,
                            ),
                            label: Text(
                              "Details",
                              style: temp,
                            )),
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                  ),
                  shiftls))
          // ListView.builder(
          //     itemCount: shiftls.length,
          //     itemBuilder: (context, index) {
          //       ShiftCard shift = shiftls[index];

          //       return Dismissible(
          //           key: Key(shift.displayDate +
          //               shift.shiftStart +
          //               shift.shiftEnd),
          //           onDismissed: (direction) {
          //             setState(() {
          //               shiftls.removeAt(index);
          //             });
          //             Scaffold.of(context).showSnackBar(
          //                 SnackBar(content: Text("Shift Removed")));
          //           },
          //           background: Container(
          //             color: Colors.cyanAccent,
          //           ),
          //           child: shift);
          //     }),
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
    DateTime _date;
    String _displayDate;
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
          _displayDate = "0${date.day}/${date.month}/${date.year}";
        } else {
          _displayDate = "${date.day}/${date.month}/${date.year}";
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
    if (_displayDate == null) {
      dateErrorMessage();
    } else if (_shiftStart == null) {
      dateErrorMessage();
    } else if (_shiftEnd == null) {
      dateErrorMessage();
    } else {
      setState(() {
        shifts.add(ShiftCard(
            displayDate: _displayDate,
            shiftEnd: _shiftEnd,
            shiftStart: _shiftStart,
            date: _date));
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

  static List<Widget> wrap(Widget row1, List<Widget> widgeLs) {
    widgeLs.insert(0, row1);
    return widgeLs;
  }
}

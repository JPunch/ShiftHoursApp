import 'package:flutter/material.dart';
import '../classes/shift_card.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import '../classes/calculator.dart';

class Calculation extends StatefulWidget {
  Map data;
  Calculation({Key key, @required this.data}) : super(key: key);
  @override
  _CalculationState createState() =>
      _CalculationState(data["shiftls"], data["pay"]);
}

// TODO: add button class into main page class and then access the buttons values for get shifts
class _CalculationState extends State<Calculation> {
  //Calculation should return these values to screen
  double totalHours;
  double grossPay;
  double takeHomePay;
  double tax;
  double ni;
  DateTime datefrom;
  DateTime dateto;
  Duration days;
  //The shifts to be used for the calculations from the shifts screen
  List<ShiftCard> shifts;
  double pay;
  _CalculationState(this.shifts, this.pay);
  // text styles for rows
  final TextStyle rowTitle = TextStyle(fontSize: 25, color: Colors.grey);
  final TextStyle rowValue = TextStyle(fontSize: 25, color: Colors.greenAccent);
  final TextStyle temp =
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white);

  String dateCheck(DateTime date) {
    if (date == null) {
      return "Select Date";
    } else {
      return formatDateTime(date);
    }
  }

  String formatDateTime(DateTime date) {
    if (date.day.toString().length == 1) {
      return "0${date.day}/${date.month}/${date.year}";
    } else {
      return "${date.day}/${date.month}/${date.year}";
    }
  }

  @override
  Widget build(BuildContext context) {
    if (this.dateto != null) {
      if (this.datefrom != null) {
        this.days = this.datefrom.difference(this.dateto);
        this.totalHours = getHours(shifts, this.datefrom, this.dateto);
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[600],
        title: Text(
          "Get that PAY",
          textAlign: TextAlign.center,
        ),
      ),
      backgroundColor: Colors.blueGrey[800],
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  SizedBox(
                    width: 40,
                  ),
                  Column(
                    // TODO: make each entry for the column a stateless class and have the data sent to it on creation
                    children: <Widget>[
                      Text(
                        "Date from",
                        style: rowTitle,
                      ),
                      RaisedButton(
                          child: Text(
                            dateCheck(this.datefrom),
                            style: temp,
                          ),
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          onPressed: () {
                            DatePicker.showDatePicker(
                              context,
                              theme: DatePickerTheme(),
                              showTitleActions: true,
                              currentTime: DateTime.now(),
                              onConfirm: (dates) {
                                setState(() {
                                  this.datefrom = dates;
                                });
                              },
                            );
                          })
                      // Text("Select date")
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        "Date to",
                        style: rowTitle,
                      ),
                      RaisedButton(
                          child: Text(
                            dateCheck(this.dateto),
                            style: temp,
                          ),
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          onPressed: () {
                            DatePicker.showDatePicker(
                              context,
                              theme: DatePickerTheme(),
                              showTitleActions: true,
                              currentTime: DateTime.now(),
                              onConfirm: (dates) {
                                setState(() {
                                  this.dateto = dates;
                                });
                              },
                            );
                          })
                      // Text("Select date")
                    ],
                  ),
                  SizedBox(
                    width: 40,
                  )
                ],
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Total Hours :  ", style: rowTitle),
                  SizedBox(
                    width: 20,
                  ),
                  Text("$totalHours", style: rowValue)
                ], // date from - date to use datepicker
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Gross pay :  ", style: rowTitle),
                  SizedBox(
                    width: 20,
                  ),
                  Text("$grossPay", style: rowValue)
                ], // date from - date to use datepicker
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Tax :  ", style: rowTitle),
                  SizedBox(
                    width: 20,
                  ),
                  Text("$tax", style: rowValue)
                ], // date from - date to use datepicker
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("National insurance :  ", style: rowTitle),
                  SizedBox(
                    width: 20,
                  ),
                  Text("$ni", style: rowValue)
                ], // date from - date to use datepicker
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Take home pay :  ", style: rowTitle),
                  SizedBox(
                    width: 20,
                  ),
                  Text("$takeHomePay", style: rowValue)
                ], // date from - date to use datepicker
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.attach_money),
        label: Text(
          "Calculate Pay",
          style: temp,
        ),
        backgroundColor: Colors.cyanAccent[500],
        onPressed: () {
          setState(() {
            Calculator resultCalc =
                Calculator(shifts, days, this.totalHours, this.pay);
            // grossPay = results[0];
            // takeHomePay = results[1];
            // tax = results[2];
            // ni = results[3];
          });
        },
      ),
    );
  }

  static double getHours(
      List<ShiftCard> shifts, DateTime date1, DateTime date2) {
    double totalHours = 0;
    for (var i = 0; i < shifts.length; i++) {
      DateTime currentDate = shifts[i].date;
      if (currentDate.compareTo(date2) <= 0) {
        if (currentDate.compareTo(date1) >= 0) {
          totalHours += shifts[i].getShiftLength();
        }
      }
      // totalHours += shifts[i].getShiftLength();
    }
    return totalHours;
  }
}

class DateButton extends StatefulWidget {
  String date;
  static final TextStyle rowValue =
      TextStyle(fontSize: 15, color: Colors.greenAccent);

  @override
  _DateButtonState createState() => _DateButtonState();
}

class _DateButtonState extends State<DateButton> {
  String date;

  @override
  Widget build(BuildContext context) {
    return selector(this.date, context);
  }

  Widget selector(String dates, BuildContext context) {
    if (date == null) {
      return button("Select Date", context);
    } else {
      setState(() {
        widget.date = "$dates";
      });
      return button("$dates", context);
    }
  }

  Widget button(String dates, BuildContext context) {
    return RaisedButton(
        child: Text(
          "$dates",
          style: DateButton.rowValue,
        ),
        color: Colors.blue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onPressed: () {
          DatePicker.showDatePicker(
            context,
            theme: DatePickerTheme(),
            showTitleActions: true,
            currentTime: DateTime.now(),
            onConfirm: (dates) {
              String _date = "${dates.day}/${dates.month}/${dates.year}";
              setState(() {
                date = _date;
              });
            },
          );
        });
  }
}

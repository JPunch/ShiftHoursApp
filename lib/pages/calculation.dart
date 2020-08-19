import 'package:flutter/material.dart';
import '../classes/shift_card.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class Calculation extends StatefulWidget {
  List<ShiftCard> shifts;
  Calculation({Key key, @required this.shifts}) : super(key: key);
  @override
  _CalculationState createState() => _CalculationState(shifts);
}

class _CalculationState extends State<Calculation> {
  //Calculation should retutn these values to screen
  Future<double> grossPay;
  Future<double> takeHomePay;
  Future<double> tax;
  Future<double> ni;
  //The shifts to be used for the calculations from the shifts screen
  List<ShiftCard> shifts;
  _CalculationState(this.shifts);
  // text styles for rows
  final TextStyle rowTitle = TextStyle(fontSize: 25, color: Colors.grey);
  final TextStyle rowValue = TextStyle(fontSize: 25, color: Colors.greenAccent);
  @override
  Widget build(BuildContext context) {
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
              // Text("Calculation page", style: TextStyle(fontSize: 25, color: Colors.white)),
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
                    children: <Widget>[
                      Text(
                        "Date from",
                        style: rowTitle,
                      ),
                      DateButton()
                      // Text("Select date")
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        "Date to",
                        style: rowTitle,
                      ),
                      DateButton()
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
      floatingActionButton: PayButton(),
    );
  }

  static double getHours(List<ShiftCard> shifts) {
    double totalHours = 0;
    for (var i = 0; i < shifts.length; i++) {
      totalHours += shifts[i].getShiftLength();
    }
    return totalHours;
  }
}

class PayButton extends StatelessWidget {
  final TextStyle temp =
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white);
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
        icon: Icon(Icons.attach_money),
        label: Text(
          "Calculate Pay",
          style: temp,
        ),
        onPressed: null);
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

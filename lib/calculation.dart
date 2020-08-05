import 'package:flutter/material.dart';
import 'shift_card.dart';

class Calculation extends StatefulWidget {
  List<ShiftCard> shifts;
  Calculation({Key key, @required this.shifts}) : super(key: key);
  @override
  _CalculationState createState() => _CalculationState(shifts);
}

// TODO: finish page setup
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
  final TextStyle rowText = TextStyle(fontSize: 25, color: Colors.white);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text("Calculation page",
                  style: TextStyle(fontSize: 25, color: Colors.white)),
              SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  SizedBox(
                    width: 40,
                  ),
                  // TODO: add a button for select dates and then replace the button with the selected date
                  Column(
                    children: <Widget>[
                      Text("Date from"),
                      Text("Placeholder: select date")
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text("Date to"),
                      Text("Placeholder: select date")
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
                  Text("Gross pay :  ", style: rowText),
                  SizedBox(
                    width: 20,
                  ),
                  Text("$grossPay", style: rowText)
                ], // date from - date to use datepicker
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Tax paid :  ", style: rowText),
                  SizedBox(
                    width: 20,
                  ),
                  Text("$grossPay", style: rowText)
                ], // date from - date to use datepicker
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("National insurance paid :  ", style: rowText),
                  SizedBox(
                    width: 20,
                  ),
                  Text("$grossPay", style: rowText)
                ], // date from - date to use datepicker
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Take home pay :  ", style: rowText),
                  SizedBox(
                    width: 20,
                  ),
                  Text("$grossPay", style: rowText)
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

import 'package:flutter/material.dart';
import 'package:test_flutter_app/home.dart';

class Calculation extends StatefulWidget {
  @override
  _CalculationState createState() => _CalculationState();
}

class _CalculationState extends State<Calculation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        Row(
          children: <Widget>[], // date from - date to use datepicker
        ),
      ),
    );
  }
}
//account_balance
//attach_money

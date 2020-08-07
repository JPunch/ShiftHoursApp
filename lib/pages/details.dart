import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}
// TODO: finish page setup

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[800],
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
          child: Center(
            child: TextFormField(
              initialValue: "Pay per hour",
            ),
          ),
        ));
  }
}

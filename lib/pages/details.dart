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
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[600],
          title: Text(
            "Enter those DETAILS",
            textAlign: TextAlign.center,
          ),
        ),
        backgroundColor: Colors.blueGrey[800],
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
          child: Center(
            child: TextFormField(
              decoration: const InputDecoration(
                  icon: Icon(Icons.attach_money),
                  labelText: "Pay Per Hour",
                  hintText: "How much do you earn per hour?"),
              validator: (String message) {
                return message.contains(new RegExp(r'[A-Za_z]'))
                    ? 'Only input numbers.'
                    : null;
              },
            ),
          ),
        ));
  }
}

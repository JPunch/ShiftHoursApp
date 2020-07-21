import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    home: Home(),
  ));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("my first app"),
          centerTitle: true,
          backgroundColor:  Colors.deepPurpleAccent[200]
        ),
        body: Center(
          child: Text(
              "Shift hours app",
              style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              color: Colors.grey[200]
          ),
        ),
    ),
    floatingActionButton: FloatingActionButton(
    onPressed: () {},
    child: Text("add hours"),
    backgroundColor:  Colors.deepPurpleAccent[200],
    ),
    );
  }
}


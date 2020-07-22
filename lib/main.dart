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
          backgroundColor: Colors.deepPurpleAccent[200]),
      body: Center(
        child: Icon(
          Icons.add_alarm,
          color: Colors.cyanAccent[400],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text("add hours"),
        backgroundColor: Colors.deepPurpleAccent[200],
      ),
    );
  }
}

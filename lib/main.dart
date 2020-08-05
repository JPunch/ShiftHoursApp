import 'package:flutter/material.dart';
import 'package:test_flutter_app/details.dart';
import 'package:test_flutter_app/calculation.dart';
import 'shift_card.dart';
import 'home.dart';

List<ShiftCard> shifts = [
  // dummy shifts
  ShiftCard(date: "25/07/2020", shiftStart: "09:00", shiftEnd: "15:30"),
  ShiftCard(date: "26/07/2020", shiftStart: "09:00", shiftEnd: "17:00"),
  ShiftCard(date: "27/07/2020", shiftStart: "11:00", shiftEnd: "18:00")
];
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String _title = "Shifts Hours Pay";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  // Home(Key key) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    JackCard(shifts: shifts),
    Calculation(shifts: shifts),
    Details()
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shifts Hours Pay"),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
      ),
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 20,
        unselectedFontSize: 20,
        iconSize: 30,
        unselectedItemColor: Colors.white70,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.schedule), title: Text("Shifts")),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance), title: Text("Pay")),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), title: Text("Details"))
        ],
        backgroundColor: Colors.grey[850],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

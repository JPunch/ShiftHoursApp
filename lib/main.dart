import 'package:flutter/material.dart';
import 'package:test_flutter_app/home.dart';
import 'package:test_flutter_app/profile.dart';
import 'package:test_flutter_app/calculation.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      // home: JackCard(),
      routes: {
        '/': (context) => JackCard(),
        '/profile': (context) => Profile(),
        '/calculation': (context) => Calculation(),
      },
    ));

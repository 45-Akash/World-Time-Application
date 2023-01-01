import 'package:flutter/material.dart';
import 'package:world_time/pages/choose_location.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading.dart';

void main() => runApp(MaterialApp(
      // home: Home(),
      initialRoute: '/',
      routes: {
        // '/' means the base widget that the first screen which wwill appear on screen
        '/': ((context) => LoadingScreen()),
        '/home': (context) => Home(),
        '/location': (context) => ChooseLocation(),
      },
    ));

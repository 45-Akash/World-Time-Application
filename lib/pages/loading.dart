import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'package:world_time/services/word_time.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String time = "Loading";
  void setupWorldTime() async {
    Worldtime instance = Worldtime(
        location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await instance.getTime();
    // print(instance.time);
    // setState(() {
    //   time = instance.time;
    // });

    // to send data from one screen to another (route to route)
    //using third argument ( map )
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime' : instance.isDaytime,
    });
  }

  //The initState function runs only once when the page is loaded
  @override
  void initState() {
    super.initState();
    // print('initState function run ');
    setupWorldTime();

    //The above fun is async so it not blocks the print to execute
    print('hey ak');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        body: Center(
      child: SpinKitFadingFour(
        color: Colors.white,
        size: 50.0,
      ),
    ));
  }
}

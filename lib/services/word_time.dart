import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';

class Worldtime {
  late String location; //Location name for the UI
  late String time; //Time of that location
  late String flag; //Url to asset image icon

  late String url; //location url for api end point
  late bool isDaytime; // to check day or night

  Worldtime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    // Response response =
    //     await get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
    // Map data = jsonDecode(response.body);
    // print(data);
    // print(data['userId']);

    try {
      //make a World time request
      Response response =
          await get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
      Map data = jsonDecode(response.body);
      // print(data);

      //Get properties from data
      String dateTime = data['datetime'];
      String offSet = data['utc_offset'].substring(1, 3);
      // print(dateTime);
      // print(offSet);

      //create a dataTime object
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offSet)));
      // print(now);

      //set time property
      // print(now.hour);
      isDaytime = now.hour >= 16 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print("caught error: $e");
      time = "could not get time ";
    }
  }
}

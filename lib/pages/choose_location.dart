import 'package:flutter/material.dart';

import '../services/word_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<Worldtime> locations = [
    Worldtime(url: 'Asia/Kolkata', location: 'Delhi', flag: 'india.png'),
    Worldtime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    Worldtime(url: 'Europe/Athens', location: 'Athens', flag: 'greece.png'),
    Worldtime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    Worldtime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    Worldtime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    Worldtime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    Worldtime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    Worldtime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(index) async {
    Worldtime instance = locations[index];
    await instance.getTime();

    //navigate to home screen and pass the data generated (updated time)
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime' : instance.isDaytime,
    });
  }

  int counter = 0;

  // // The async function does not blocks the execution of other task
  // // It runs behind independently
  // void getData() async {
  //   //simulate a network request to get boi of  a username

  //   //Below function takes two arguments
  //   // first is time which is delay time
  //   // second one is function which is performed after the delay
  //   // This will not block the code below it

  //   // When we use async functiuon and add await on this
  //   // then the below code will execute after this
  //   // it blocks the execution then
  //   String username = await Future.delayed(Duration(seconds: 3), () {
  //     return 'Akash';
  //   });

  //   //The following print statement will not wait for delay function it gets executed
  //   // print('Kanni');

  //   String bio = await Future.delayed(Duration(seconds: 2), () {
  //     return 'Software Developer 1 @ Amazon';
  //   });

  //   print('$username - $bio');
  // }

  // //The initState function runs only once when the page is loaded
  // @override
  // void initState() {
  //   super.initState();
  //   // print('initState function run ');
  //   getData();

  //   //The above fun is async so it not blocks the print to execute
  //   print('hey ak');
  // }

  //The build functions runs multiple times to set changes made in screen
  @override
  Widget build(BuildContext context) {
    // print('Build function run ');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.amber[300],
        title: Text('Choose Location'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
              child: Card(
                  child: ListTile(
                onTap: () {
                  print(locations[index].location);
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/${locations[index].flag}'),
                ),
              )),
            );
          }),
    );
  }
}

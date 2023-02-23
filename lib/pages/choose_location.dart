//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(loc_url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(loc_url: 'Europe/Athens', location: 'Athens', flag: 'greece.png'),
    WorldTime(loc_url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(
        loc_url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(loc_url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(
        loc_url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(loc_url: 'Asia/Kolkata', location: 'Kolkata', flag: 'india.png'),
    WorldTime(
        loc_url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(
        loc_url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime (index) async {
    WorldTime instance = locations[index];
    await instance.getTime();

    // nvaigate to home page
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
        child: ListView.builder(
          itemCount: locations.length,
          itemBuilder: ((context, index) {
            return Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

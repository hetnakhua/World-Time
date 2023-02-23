//library pages;
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;
    print(data);

    // set background
    String bgImage = data['isDayTime'] ? 'day.png' : 'night.png';
    Color bgColor =
        data['isDayTime'] ? Colors.blue.shade400 : Colors.indigo.shade900;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/$bgImage'),
          fit: BoxFit.cover,
        )),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
            children: [
              TextButton.icon(
                onPressed: () async {
                  dynamic result =
                      await Navigator.pushNamed(context, '/location');
                  setState(() {
                    data = {
                      'location': result['location'],
                      'flag': result['flag'],
                      'time': result['time'],
                      'isDayTime': result['isDayTime'],
                    };
                  });
                },
                icon: Icon(
                  Icons.edit_location_alt_outlined,
                  color: Colors.grey[300],
                ),
                label: Text(
                  'Edit location',
                  style: TextStyle(
                    color: Colors.grey[300],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['location'],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              Text(
                data['time'],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

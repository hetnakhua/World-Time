import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // String time = 'loading';

  void setUpWorldTime() async {
    WorldTime instance = WorldTime(
        location: 'Kolkata', flag: 'india.png', loc_url: 'Asia/Kolkata');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
    // print(instance.time);
    // setState(() {
    //   time = instance.time;
    // });
  }

  @override
  void initState() {
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitThreeBounce(
              color: Colors.white,
              size: 50.0,
            ),
            SizedBox(height: 50),
            SpinKitChasingDots(
              color: Colors.white,
              size: 50.0,
            ),
            SizedBox(height: 50),
            SpinKitThreeBounce(
              itemBuilder: (BuildContext context, int index) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: index.isEven ? Colors.white : Colors.black,
                  ),
                );
              },
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

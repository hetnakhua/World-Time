import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; // location name for ui
  String time = ""; // time for the above location
  String flag; // url to an asset flag icon
  String loc_url; // location url for api endpoint
  bool isDayTime = false;

  WorldTime(
      {required this.location, required this.flag, required this.loc_url});

  Future<void> getTime() async {
    try {
      // make the request
      var url = Uri.parse('http://worldtimeapi.org/api/timezone/$loc_url');
      var response = await http.get(url);

      // mapping the response
      Map data = jsonDecode(response.body);
      // print(data);

      // get properties from data
      String datetime = data['utc_datetime'];
      String offset_hours = data['utc_offset'].substring(1, 3);
      String offset_minutes = data['utc_offset'].substring(4, 6);
      print(datetime);
      print(offset_hours);
      print(offset_minutes);

      // create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(
          hours: int.parse(offset_hours), minutes: int.parse(offset_minutes)));

      // set the time property
      isDayTime = now.hour > 6 && now.hour < 20;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('caught error: $e');
      time = 'couldn\'t load time data';
    }
  }
}

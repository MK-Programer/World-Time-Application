import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location = ''; // location name of the UI
  String time = ''; // the time in that location
  String flag = ''; // url to an asset flag icon
  String url = ''; // location url for api endpoint
  bool isDaytime = true; // true or false if daytime or not

  WorldTime({required this.location, required this.flag, required this.url});



  Future<void> getTime() async{
    // Response response =  await get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
    // Map data =  jsonDecode(response.body);
    // print(data['title']);

    // error handling
    try {
      // make the request
      Response response = await get(
          Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      // print(data);

      // get properties from data
      String datetime = data['utc_datetime'];
      String offset = data['utc_offset'].substring(1,3);
      // print(datetime);
      // print(offset);

      // create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      // print(now);

      // ternary operator
      // time between 6 and 20(8) el sob7 else blel
      // mn 7 am l 7 pm el sob7 else blel
      isDaytime = now.hour > 6 && now.hour > 20  ? true : false;

      // set the time property
      // change the time format from 24 to 12
      time = DateFormat.jm().format(now);
    }catch(e){
      print('caught error: $e');
      time = 'could not get time data';
    }

  }

}

// WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');

import 'package:flutter/material.dart';
import 'package:world_time_application/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  // void getData() async{
  //   // simulate network request for username
  //   String username = await Future.delayed(Duration(seconds: 3), (){
  //     return('Mostafa');
  //   });
  //
  //   // await function waits untill the function finishes
  //
  //   // simulate network request to get bio of username
  //   String bio = await Future.delayed(Duration(seconds: 2), (){
  //     return('musician');
  //   });
  //
  //   print('$username - $bio');
  //   // print statement first untill the delay ends and print mostafa
  //   print('statement');
  // }
  //
  // int counter = 0;
  //
  // // first function automatic to be run
  // @override
  // void initState() {
  //   super.initState();
  //   // print('initState function  ran');
  //   getData();
  //   print('hay there');
  // }

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();
    // navigate to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    // print('build function  ran');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0.0,
      ),
      // body: RaisedButton(
      //   onPressed: (){
      //     // reload the build function again
      //     setState(() {
      //       counter++;
      //     });
      //   },
      //   child: Text('hello world'),
      // ),
      // read from list
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text(
                  locations[index].location,
                ),
                // add the image behind the text
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),

    );
  }
}

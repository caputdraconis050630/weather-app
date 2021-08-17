
import 'package:flutter/material.dart';
import 'package:weather_project/services/location.dart';
import 'package:http/http.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  void getLocation() async{
    Location location  = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longtitude);

    getData();
  }

  void getData() async{
    Uri url = Uri.https('api.openweathermap.org', 'data/2.5/weather',{
      'lat': '35',
      'lon': '139',
      'appid' : 'b468dd02ba53798b4e7c26626255b0b3'
    });

    Response response = await get(url);
    print(response.body);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}






import 'package:flutter/material.dart';
import 'package:weather_project/services/location.dart';
import 'package:weather_project/services/networking.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apiKey = 'b468dd02ba53798b4e7c26626255b0b3';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double? latitude;
  double? longtitude;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }

  void getLocationData() async{
    Location location  = Location();
    await location.getCurrentLocation();

    latitude = location.latitude;
    longtitude = location.longtitude;

    var uri = new Uri.http('api.openweathermap.org', 'data/2.5/weather', {
      "lat" : latitude.toString(),
      "lon" : longtitude.toString(),
      "appid" : apiKey,
    });

    NetworkHelper networkHelper = NetworkHelper(url : uri.toString());

    var weatherData = await networkHelper.getData();
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen();
    }));

    print(weatherData);

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        )
      )
    );
  }
}





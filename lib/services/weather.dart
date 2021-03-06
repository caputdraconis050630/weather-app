import 'package:weather_project/services/location.dart';
import 'package:weather_project/services/networking.dart';

const apiKey = 'b468dd02ba53798b4e7c26626255b0b3';

class WeatherModel {

  Future<dynamic> getLocationWeather() async{
    Location location  = Location();
    await location.getCurrentLocation();



    var uri = new Uri.http('api.openweathermap.org', 'data/2.5/weather', {
      "lat" : location.latitude.toString(),
      "lon" : location.longtitude.toString(),
      "appid" : apiKey,
      "units": "metric",
    });

    NetworkHelper networkHelper = NetworkHelper(url : uri.toString());
    var weatherData = await networkHelper.getData();

    return weatherData;
  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}

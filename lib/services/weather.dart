import 'package:clima/screens/city_screen.dart';
import 'package:clima/screens/location.dart';
import 'networkHelper.dart';
import '../apiKey.dart';

class WeatherModel {
  String apiUrl = 'https://api.openweathermap.org/data/2.5/weather';
  Future<dynamic> getLocationPosition() async {
    Location location = Location();
    await location.getCurrentPosition();
    NetworkHelper networkHelper = NetworkHelper(
        url:
            '$apiUrl?lat=${location.latitude}&lon=${location.longitude}&appid=${apiKey}&units=metric');
    await networkHelper.getData();
    return networkHelper.data;
  }

  Future<dynamic> getCityNamePosition(cityName) async {
    Location location = Location();
    await location.getCurrentPosition();
    NetworkHelper networkHelper = NetworkHelper(
        url: '$apiUrl?q=${cityName}&appid=${apiKey}&units=metric');
    await networkHelper.getData();
    return networkHelper.data;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}

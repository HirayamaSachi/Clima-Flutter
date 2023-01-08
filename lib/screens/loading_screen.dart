import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'location.dart';
import 'package:http/http.dart' as http;
import '../apiKey.dart';
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  LocationPermission permission;
  Future<Location> getCurrentPosition() async {
    Location location = Location();
    await location.getCurrentPosition();
    return location;
    }

  void getData() async {
    Location location = await getCurrentPosition();
    var response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=${apiKey}'));
    if (response.statusCode==200) {
      var data=jsonDecode(response.body);
      double temp=data['main']['temp'];
      int conditionNumber=data['weather'][0]['id'];
      String cityName=data['name'];
      print(temp);
      print(conditionNumber);
      print(cityName);
      
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

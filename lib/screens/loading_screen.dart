import 'package:clima/services/networkHelper.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  LocationPermission permission;
  Future<Location> getCurrentPosition() async {
    var locationWeather = await WeatherModel().getLocationPosition();
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return LocationScreen(locationWeather: locationWeather);
    }));
  }

  @override
  void initState() {
    super.initState();
    getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}

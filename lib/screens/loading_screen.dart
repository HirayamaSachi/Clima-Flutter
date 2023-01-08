import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  LocationPermission permission;
  void getCurrentPosition() async{
    Location location = Location();
    await location.getCurrentPosition();
    print(location.latitude);
    print(location.longitude);
  }

  @override
  void initState() {
    super.initState();
    getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

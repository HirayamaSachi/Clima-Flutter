import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;
  Future<void> getCurrentPosition() async {
    try {
      bool isLocationServiceEnabled =
          await Geolocator.isLocationServiceEnabled();

      await Geolocator.checkPermission();
      await Geolocator.requestPermission();

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude=position.latitude;
      longitude=position.longitude;
    } on Exception catch (e) {
      print(e);
    }
  }
}

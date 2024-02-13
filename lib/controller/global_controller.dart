import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../model/weather_model.dart';
import '../services/weather_services.dart';

class GlobalController extends GetxController {
  static GlobalController get instance => Get.find();
  var isLoading = false.obs;
   WeatherModel? weatherModel;
  double? latitude;
  double? longitude;

  StreamSubscription<Position>? positionStream;

  Future<Position?> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      log('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        log('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      log('Location permissions are permanently denied, we cannot request permissions.');
    }
    if (permission == LocationPermission.whileInUse) {
      positionStream =
          Geolocator.getPositionStream().listen((Position position) {
        latitude = position.latitude;
        longitude = position.longitude;
        log('Latitude: $latitude, Longitude: $longitude');
      });
    }
    update();
    return await Geolocator.getCurrentPosition();
  }
  fetchWeatherData({required double lat, required double long}) async {
    isLoading.value = true;
    try {
       WeatherModel weatherData = await WeatherServices().getCurrentWeather(
        lat: lat,
        long: long,
      );
      weatherModel = weatherData;
      isLoading.value = false;
    } catch (error) {
      log(error.toString());
      return const Center(child: Text("An Error Occurred"));
    }
    update();
  }
  @override
  void onInit() { 
      determinePosition().then((position) {
        if (position != null) {
          fetchWeatherData(long: position.latitude, lat: position.longitude);
        }
      });
    super.onInit();
  }
  @override
  void onReady() {
    if (latitude != null && longitude != null) {
      fetchWeatherData(lat: latitude!, long: longitude!);
    }
    super.onReady();
  }
  @override
  void onClose() {
    if (positionStream != null) {
      positionStream!.cancel();
    }
    super.onClose();
  }
}
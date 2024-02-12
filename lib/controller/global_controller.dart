import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../model/weather_model.dart';
import '../services/weather_services.dart';

class GlobalController extends GetxController {
  var isLoading = false.obs;
  var lattitudee = 0.0.obs;
  var longitudee = 0.0.obs;
  var weatherModel = WeatherModel().obs;

  fetchWeatherData({required lattitudee, required longitudee}) async {
    try {
      isLoading.value = true;
      const Center(
        child: CircularProgressIndicator(),
      );
      final WeatherModel model = await WeatherServices().getCurrentWeather(
        lat: lattitudee,
        long: longitudee,
      );
      weatherModel.value = model;
      isLoading.value = false;
    } catch (error) {
      log(error.toString());
      return const Center(child: Text("An Error Occurred"));
    }
  }

  StreamSubscription<Position>? positionStream;

  determinePosition() async {
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
      positionStream = Geolocator.getPositionStream().listen((Position? position) {
        final latitude = position!.latitude;
        final longitude = position.longitude;
        fetchWeatherData(lattitudee: latitude, longitudee: longitude);
      });
    }

    return await Geolocator.getCurrentPosition();
  }
}
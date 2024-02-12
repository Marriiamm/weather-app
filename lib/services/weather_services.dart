import 'dart:developer';
import 'package:dio/dio.dart';

import '../model/weather_model.dart';

class WeatherServices {
  final Dio dio = Dio();
  final String baseUrl = 'https://api.openweathermap.org/data/2.5';
  final String apiKey = '42902cd89307d737923f48ec72022416';
  Future<WeatherModel> getCurrentWeather({required double long,required double lat,}) async {
    try {
      Response response =
          await dio.get('$baseUrl/weather?lat=$lat&lon=$long&appid=$apiKey');

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'oops there was an error ,try later';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('oops there was an error ,try laterrrr');
    }
  }
}

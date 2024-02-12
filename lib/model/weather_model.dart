class WeatherModel {
  final String name;
  final String mainCondition;
  final double temp;
  final double windSpeed;
  final int humidity;
  final String condition;

  WeatherModel({
    required this.name,
    required this.mainCondition,
    required this.humidity,
    required this.temp,
    required this.windSpeed,
    required this.condition,
  });

  factory WeatherModel.fromJson(dynamic json) {
    return WeatherModel(
      name: json['name'],
      mainCondition: json['weather'][0]['main'],
      humidity: json['main']['humidity'],
      temp: json['main']['temp'].toDouble(),
      windSpeed: json['wind']['speed'].toDouble(),
      condition: json['weather'][0]['description'],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:weatherr_app/constants.dart';
import 'package:weatherr_app/model/weather_model.dart';

import 'widgets/weather_row_details.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.weatherModel});

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    double cTemp = weatherModel.temp - 32 * (5 / 9);
    return Scaffold(
      backgroundColor: kSecondClr,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: kSecondClr,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 120,
              child: Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.3,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: getAssetImage(weatherModel.condition),
                          fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  VerticalDivider(
                    indent: 10,
                    endIndent: 10,
                    color: Colors.grey.withOpacity(0.3),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    cTemp as String,
                    style: const TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w600,
                        color: kPrimaryClr,
                        fontFamily: kExo2),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              indent: 20,
              endIndent: 20,
              color: kPrimaryClr,
            ),
            const SizedBox(
              height: 20,
            ),
            WeatherRowDetails(
              customDetail: Text(
                weatherModel.condition,
                style: textStyle20(),
              ),
              customImage: "assets/images/condition.png",
            ),
            WeatherRowDetails(
              customDetail: Text(
                '${weatherModel.humidity.toString()}'' %',
                style: textStyle20(),
              ),
              customImage: "assets/images/humidity.png",
            ),
            WeatherRowDetails(
              customDetail: Text(
                "${weatherModel.windSpeed.toString()}""mi/h",
                style: textStyle20(),
              ),
              customImage: "assets/images/wind.png",
            ),
          ],
        ),
      ),
    );
  }

  TextStyle textStyle20() {
    return const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: Colors.white,
        fontFamily: kExo2);
  }

  ImageProvider getAssetImage(String condition) {
    switch (condition) {
      case 'Clear':
        return const AssetImage("assets/images/sun.png");
      case 'Thunderstorm':
        return const AssetImage("assets/images/thunderstorm.png");
      case 'Clouds':
        return const AssetImage("assets/images/cloudy.png");
      case 'Drizzle':
        return const AssetImage("assets/images/rainy.png");
      case 'Rain':
        return const AssetImage("assets/images/rain.png");
      case 'Snow':
        return const AssetImage("assets/images/blowing.png");
      case 'Atmosphere':
        return const AssetImage("assets/images/stratuscumulus.png");
      default:
        return const AssetImage("assets/images/cloudsandsun.png");
    }
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherr_app/constants.dart';

import '../controller/global_controller.dart';
import 'widgets/weather_row_details.dart';

class DetailsView extends GetView<GlobalController> {
  const DetailsView({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondClr,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: kSecondClr,
      ),
      body: SafeArea(
        child: GetBuilder<GlobalController>(builder: (controller) {
          int cTemp = 0;
          if (controller.weatherModel != null) {
            cTemp = (controller.weatherModel!.temp - 273.15).toInt();
          }
          return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height*0.15,
                alignment: Alignment.center,
                child: Row(
                  children: [
                    const Spacer(),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: getAssetImage(controller.weatherModel?.mainCondition??"Loading...",),
                            fit: BoxFit.cover),
                      ),
                    ),
                    const Spacer(),
                    VerticalDivider(
                      indent: 10,
                      endIndent: 10,
                      color: Colors.grey.withOpacity(0.3),
                    ),
                    const Spacer(),
                    Text(
                      '${cTemp.toString()}''°',
                      style: const TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.w600,
                          color: kPrimaryClr,
                          fontFamily: kExo2),
                    ),
                    const Spacer(flex: 3,),
                  ],
                ),
              ),
              const Spacer(),
              const Divider(
                indent: 20,
                endIndent: 20,
                color: kPrimaryClr,
              ),
              const Spacer(),
              WeatherRowDetails(
                customDetail: Text(
                  controller.weatherModel?.condition??"",
                  style: textStyle20(),
                ),
                customImage: "assets/images/cloudsandsun.png",
              ),
              WeatherRowDetails(
                customDetail: Text(
                  "${controller.weatherModel?.humidity.toString()}"" %" ,
                  style: textStyle20(),
                ),
                customImage: "assets/images/humidity.png",
              ),
              WeatherRowDetails(
                customDetail: Text(
                  "${controller.weatherModel?.windSpeed.toString()}"" mi/h" ,
                  style: textStyle20(),
                ),
                customImage: "assets/images/wind.png",
              ),
              const Spacer(flex: 6,)
            ],
          ),
        );} ,),
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
        return const AssetImage("assets/images/stratuscumulus.png");
    }
  }
}

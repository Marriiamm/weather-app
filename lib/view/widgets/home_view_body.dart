import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../../model/weather_model.dart';
import '../details_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody( {super.key, required this.weatherModel,});

  final WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/home_background.png"),
            fit: BoxFit.cover),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 3,),
           Text(
            weatherModel.temp.toString(),
            style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w600,
                color: kPrimaryClr,
                fontFamily: kExo2),
          ),
          const Spacer(flex: 1,),
          TextButton(
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
              Color.fromRGBO(11, 213, 153, 1),
            )),
            onPressed: () {
              Get.to(
                () =>  DetailsView(weatherModel: weatherModel,),
                duration: const Duration(seconds: 1),
                transition: Transition.fade,
              );
            },
            child: const Text("Check More Details",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: kSecondClr,
                    fontFamily: kExo2)),
          ),
          const Spacer(flex: 8,),
        ],
      ),
    );
  }
}

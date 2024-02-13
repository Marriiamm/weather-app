import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../../controller/global_controller.dart';
import '../details_view.dart';

class HomeViewBody extends GetView<GlobalController> {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/home_background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: GetX<GlobalController>(
        builder: (controller) {
          double cTemp = controller.weatherModel.temp - 32 * (5 / 9);
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 3,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.location_on_rounded, color: kPrimaryClr, size: 36.0,),
                  const SizedBox(width: 20,),
                  Text(
                    controller.weatherModel.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: kPrimaryClr,
                      fontFamily: kExo2,
                    ),
                  ),
                ],
              ),
              const Spacer(flex: 1,),
              Text(
                '${cTemp.toString()}''°',
                style: const TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.w600,
                  color: kPrimaryClr,
                  fontFamily: kExo2,
                ),
              ),
              const Spacer(flex: 1,),
              TextButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    kPrimaryClr,
                  ),
                ),
                onPressed: () {
                  Get.to(
                    () => const DetailsView(),
                    duration: const Duration(seconds: 1),
                    transition: Transition.fade,
                  );
                },
                child: const Text(
                  "Check More Details",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: kSecondClr,
                    fontFamily: kExo2,
                  ),
                ),
              ),
              const Spacer(flex: 8,),
            ],
          );
        },
      ),
    );
  }
}

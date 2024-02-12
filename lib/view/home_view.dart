import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/global_controller.dart';
import 'widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalController weatherController = Get.put(GlobalController());

  @override
  void initState() {
    weatherController.determinePosition();
    super.initState();
  }

  @override
  void dispose() {
    if (weatherController.positionStream != null) {
      weatherController.positionStream!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var weatherModel = weatherController.weatherModel();
    return Scaffold(
      body: 
           HomeViewBody(weatherModel: weatherModel)
    );
  }
}
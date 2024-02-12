import 'package:flutter/material.dart';
import 'package:weatherr_app/constants.dart';

import 'view/home_view.dart';
import 'package:get/get.dart';


void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryClr),
        useMaterial3: true,
      ),
      home:  const HomeView(),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/global_controller.dart';
import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final GlobalController homeController = Get.put(GlobalController());
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: HomeViewBody());
  }
}

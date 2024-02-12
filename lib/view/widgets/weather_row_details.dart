import 'package:flutter/material.dart';
import 'package:weatherr_app/constants.dart';

class WeatherRowDetails extends StatelessWidget {
  const WeatherRowDetails({
    super.key,
    required this.customDetail,
    required this.customImage,
  });

  final Text customDetail;
  final String customImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 8),
      child: Row(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 0.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                width: 2,
                color: kPrimaryClr,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(customImage),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          customDetail,
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tech_event/constants/constants.dart';

class EventDetailShimmer extends StatelessWidget {
  const EventDetailShimmer({
    super.key,
    required this.constantsColor,
  });

  final Constants constantsColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer.fromColors(
            baseColor: const Color(0xFFECECEC),
            highlightColor: const Color.fromARGB(255, 212, 212, 212),
            child: Container(
              color: Colors.black,
              width: 150,
              height: 15,
            ),
          ),
          const Gap(15),
          Shimmer.fromColors(
            baseColor: const Color(0xFFECECEC),
            highlightColor: const Color.fromARGB(255, 212, 212, 212),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: constantsColor.fourth.withOpacity(0.8),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(255, 224, 224, 224),
                    blurRadius: 3,
                    offset: Offset(1, 2), // Shadow position
                  ),
                ],
              ),
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "",
                        ),
                        Text(
                          "",
                        ),
                        Text(
                          "",
                        ),
                        Text(
                          "",
                        ),
                      ],
                    ),
                    Gap(10),
                    Text(
                      "",
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Gap(15),
          Shimmer.fromColors(
            baseColor: const Color(0xFFECECEC),
            highlightColor: const Color(0xFFD4D4D4),
            child: Container(
              color: Colors.black,
              width: 150,
              height: 10,
            ),
          ),
          const Gap(15),
          Shimmer.fromColors(
            baseColor: const Color(0xFFECECEC),
            highlightColor: const Color.fromARGB(255, 212, 212, 212),
            child: Container(
              color: Colors.black,
              width: double.infinity,
              height: 200,
            ),
          ),
          const Gap(15),
          Shimmer.fromColors(
            baseColor: const Color(0xFFECECEC),
            highlightColor: const Color.fromARGB(255, 212, 212, 212),
            child: Container(
              color: Colors.black,
              width: double.infinity,
              height: 35,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class TimeWidget extends StatelessWidget {
  const TimeWidget({
    super.key,
    required this.timer,
    required this.title,
  });

  final String timer;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 12.0,
          right: 12.0,
          top: 2,
          bottom: 2,
        ),
        child: Column(
          children: [
            Text(
              timer,
              style: const TextStyle(
                fontSize: 20,
              ), // Replace with your desired styles
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
              ), // Replace with your desired styles
            ),
          ],
        ),
      ),
    );
  }
}

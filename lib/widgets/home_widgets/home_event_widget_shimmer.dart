import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomeEventShimmer extends StatelessWidget {
  const HomeEventShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Shimmer.fromColors(
            baseColor: const Color(0xFFECECEC),
            highlightColor: const Color.fromARGB(255, 212, 212, 212),
            child: Container(
              width: double.infinity,
              height: 330,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          Shimmer.fromColors(
            baseColor: const Color(0xFFECECEC),
            highlightColor: const Color.fromARGB(255, 212, 212, 212),
            child: Container(
              width: double.infinity,
              height: 330,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          Shimmer.fromColors(
            baseColor: const Color(0xFFECECEC),
            highlightColor: const Color.fromARGB(255, 212, 212, 212),
            child: Container(
              width: double.infinity,
              height: 330,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

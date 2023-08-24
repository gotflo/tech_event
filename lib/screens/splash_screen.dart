import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

import '../constants/constants.dart';
import 'home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
        (r) => false,
      ),
    );
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Constants constantsColor = Constants();
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              constantsColor.second,
              constantsColor.fourth,
              constantsColor.third,
              constantsColor.primary,
            ],
          ),
        ),
        child: Column(
          children: [
            Gap(
              MediaQuery.sizeOf(context).height / 3.5,
            ),
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFFFFFFFF),
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  children: [
                    FadeIn(
                      child: Image.asset(
                        'asset/logo/tech_event_logo_simple.png',
                        fit: BoxFit.cover,
                        width: 130,
                        height: 90,
                        alignment: Alignment.center,
                      ),
                    ),
                    FadeInUp(
                      child: Image.asset(
                        'asset/logo/TECH_EVENT_texte.png',
                        fit: BoxFit.cover,
                        width: 130,
                        alignment: Alignment.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const CircularProgressIndicator(
                      color: Color(0xFFEBEBEB),
                    ),
                    const Gap(15),
                    FadeInUpBig(
                      child: const Text(
                        "TECH EVENT",
                        style: TextStyle(
                          color: Color(0xFF505050),
                        ),
                      ),
                    ),
                    FadeInUpBig(
                      child: const Text(
                        "THE TECHNOLOGY AGENDA",
                        style: TextStyle(
                          color: Color(0xFF505050),
                        ),
                      ),
                    ),
                    const Gap(60),
                  ],
                ),
              ),
            ),
            // Text("Tech")
          ],
        ),
      ),
    );
  }
}

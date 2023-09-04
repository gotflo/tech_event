import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:tech_event/theme.dart';

import 'firebase_options.dart';
import 'providers/top_event_provider.dart';
import 'screens/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Initialisez les informations de localisation pour le français
  initializeDateFormatting('fr_FR', null);
  runApp(
    ChangeNotifierProvider(
      create: (context) => EventProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize EventProvider
    final eventProvider = Provider.of<EventProvider>(context);
    eventProvider.fetchEvents();

    return MaterialApp(
      title: 'Tech Event',
      debugShowCheckedModeBanner: false,
      theme: themeOf(context),
      home: const SplashScreen(),
    );
  }
}

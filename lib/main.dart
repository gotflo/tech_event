import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'constants/constants.dart';
import 'providers/top_event_provider.dart';
import 'screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  initializeDateFormatting('fr_FR',
      null); // Initialisez les informations de localisation pour le français
  runApp(
    ChangeNotifierProvider(
      create: (context) => EventProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Constants constantsColor = Constants();
    // Initialize EventProvider
    final eventProvider = Provider.of<EventProvider>(context);
    eventProvider.fetchEvents();
    return MaterialApp(
      title: 'Tech Event',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: constantsColor.primary,
          iconTheme: const IconThemeData(
            color:
                Colors.white, // Couleur des icônes de la barre d'applications
          ),
          toolbarTextStyle:
              GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
                  .apply(
                    // Style de texte de la barre d'applications
                    bodyColor: const Color(
                        0xEFFFFFFF), // Couleur du texte de la barre d'applications
                    decorationColor: Colors
                        .white, // Couleur du texte de décoration de la barre d'applications (par exemple, les icônes)
                  )
                  .bodyMedium,
          titleTextStyle:
              GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
                  .apply(
                    // Style de texte de la barre d'applications
                    bodyColor: const Color(
                        0xEFFFFFFF), // Couleur du texte de la barre d'applications
                    decorationColor: Colors
                        .white, // Couleur du texte de décoration de la barre d'applications (par exemple, les icônes)
                  )
                  .titleLarge,
        ),
        primaryColor: constantsColor
            .primary, // Couleur de l'appBar et couleur par défaut de l'application
        hintColor: constantsColor.primary, // Couleur d'accentuation
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context)
            .textTheme), // Style de texte avec Google Font Poppins
        colorScheme: ColorScheme.fromSeed(
          seedColor: constantsColor.primary,
        ),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      // home: SupabaseTest(),
    );
  }
}

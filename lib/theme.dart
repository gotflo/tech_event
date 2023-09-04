import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_event/constants/constants.dart';

const constantsColor = Constants();

ThemeData themeOf(BuildContext context) => ThemeData(
      appBarTheme: AppBarTheme(
        color: constantsColor.primary,
        iconTheme: const IconThemeData(
          color: Colors.white, // Couleur des icônes de la barre d'applications
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
      textTheme: GoogleFonts.poppinsTextTheme(
        Theme.of(context).textTheme,
      ), // Style de texte avec Google Font Poppins
      colorScheme: ColorScheme.fromSeed(
        seedColor: constantsColor.primary,
      ),
      useMaterial3: true,
    );

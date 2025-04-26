import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'pages/home_page.dart';
import 'list_content.dart';
import 'about.dart';
var logger = Logger(); // Declaracion del log para poder usarlo


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    logger.i("Logger is working!"); // Colocamos el log antes de iniciar la aplicacion (My App)
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.lightGreenAccent,
            brightness: Brightness.dark,
          ),

          textTheme: TextTheme(
            displayLarge: const TextStyle(
            fontSize: 72,
            fontWeight: FontWeight.bold,
          ),

          titleLarge: GoogleFonts.oswald(
            fontSize: 30,
            fontStyle: FontStyle.italic,
          ),

          bodyMedium: GoogleFonts.merriweather(),
          displaySmall: GoogleFonts.pacifico(),
        ),
      ),
      home: const MyHomePage(title:'Flutter Demo Home Page'),
      routes: {
        '/list': (context) => ListContent(),
        '/about': (context) => const About(),
      },
    );
  }
}
import 'package:emirates_airlines_concept_ui/main_pages/home_page.dart';
import 'package:emirates_airlines_concept_ui/utils/hard_coded_data.dart';
import 'package:flutter/material.dart';

void main() {
  Utils.generateMyFlights();
  Utils.generateAvailableFlights();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage());
  }
}

import 'package:flight_booking_concept_ui/login_page.dart';
import 'package:flight_booking_concept_ui/utils/hard_coded_data.dart';
import 'package:flutter/material.dart';

void main() {
  HardCodedData.generateHardCodedData();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flight Booking UI Concept',
        home: LoginPage(),
      );
}

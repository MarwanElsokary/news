import 'package:api/screens/home.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HoomeScreen.routeName: (context) => HoomeScreen(),
      },
      initialRoute: HoomeScreen.routeName,
      debugShowCheckedModeBanner: false,
    );
  }
}

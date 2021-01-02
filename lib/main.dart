import 'package:flutter/material.dart';
import 'package:sequitor/ui/consts/colors.dart';
import 'package:sequitor/ui/pick_screen/pick_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sequitor',
      theme: ThemeData(
        primarySwatch: primaryColor,
        scaffoldBackgroundColor: scaffoldBackgroundcolor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: PickScreen(),
    );
  }
}

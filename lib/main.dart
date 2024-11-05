import 'package:flutter/material.dart';
import 'package:groceryapp/const/them_data.dart';

import 'presentation/screen/HomePage/home_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Styles.themeData(true, context),
      debugShowCheckedModeBanner: false,

      home: HomePage(),
    );
  }
}


import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'desc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Store',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const HomePage(),
      routes: {
        '/': (context) => const HomePage(),
        //'/desc': ((context) => const desc())
      },
    );
  }
}

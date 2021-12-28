import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.white, shadows: [
            Shadow(
              // bottomLeft
              offset: const Offset(-1.5, -1.5),
              color: Colors.black.withOpacity(0.4),
            ),
            Shadow(
              // bottomRight
              offset: const Offset(1.5, -1.5),
              color: Colors.black.withOpacity(0.4),
            ),
            Shadow(
              // topRight
              offset: const Offset(1.5, 1.5),
              color: Colors.black.withOpacity(0.4),
            ),
            Shadow(
              // topLeft
              offset: const Offset(-1.5, 1.5),
              color: Colors.black.withOpacity(0.4),
            ),
          ]),
        ),
      ),
      home: const HomePage(),
    );
  }
}

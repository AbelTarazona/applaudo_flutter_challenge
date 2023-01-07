import 'package:flutter/material.dart';
import 'package:todo/core/app/ap_colors.dart';
import 'package:todo/presentation/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Applaudo',
      theme: ThemeData(
          scaffoldBackgroundColor: APColors.smoke,
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: APColors.comet,
                fontFamily: 'Inter',
              )),
      home: const HomePage(),
    );
  }
}

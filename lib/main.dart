import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo/core/app/ap_colors.dart';
import 'package:todo/core/utils/border.dart';
import 'package:todo/presentation/pages/home_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: APColors.smoke,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Applaudo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: APColors.smoke,
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: APColors.comet,
                fontFamily: 'Inter',
              ),
          checkboxTheme: CheckboxThemeData(
            checkColor:
                MaterialStateProperty.resolveWith((_) => APColors.comet),
            fillColor:
                MaterialStateProperty.resolveWith((_) => Colors.transparent),
            side: AlwaysActiveBorderSide(),
          )),
      home: const HomePage(),
    );
  }
}

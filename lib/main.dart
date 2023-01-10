import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/bootstrap.dart';
import 'package:todo/core/app/ap_colors.dart';
import 'package:todo/core/app/flavor.dart';
import 'package:todo/core/app/injection_container.dart';
import 'package:todo/core/app/navigator.dart';
import 'package:todo/core/utils/border.dart';
import 'package:todo/presentation/bloc/task_bloc/task_bloc.dart';

void main() {
  Flavor.instance.setFlavor = FlavorType.DEV;
  bootstrap(() => const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<TaskBloc>()),
      ],
      child: MaterialApp(
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
        navigatorKey: AppNavigator.navigatorKey,
        onGenerateRoute: AppNavigator.onGenerateRoute,
      ),
    );
  }
}

import 'package:chuck_interceptor/chuck.dart';
import 'package:get_it/get_it.dart';
import 'package:todo/core/app/center_api.dart';
import 'package:todo/core/app/flavor.dart';
import 'package:todo/core/app/navigator.dart';

final sl = GetIt.instance;

init() async {
  //=======================
  // Blocs
  //=======================

  //=======================
  // Use cases
  //=======================

  //=======================
  // Repositories
  //=======================

  //=======================
  // DataSource
  //=======================

  //=======================
  // Network
  //=======================
  sl.registerLazySingleton<CenterApi>(() => CenterApi());

  //=======================
  // Services
  //=======================
  if (Flavor.instance.showChuck == true) {
    sl.registerLazySingleton<Chuck>(() => Chuck(
        showNotification: true,
        navigatorKey: AppNavigator.navigatorKey,
        showInspectorOnShake: false));
  }
}

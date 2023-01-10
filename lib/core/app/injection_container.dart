import 'package:chuck_interceptor/chuck.dart';
import 'package:get_it/get_it.dart';
import 'package:todo/core/app/center_api.dart';
import 'package:todo/core/app/flavor.dart';
import 'package:todo/core/app/navigator.dart';
import 'package:todo/data/datasources/datasource.dart';
import 'package:todo/data/datasources/datasource_impl.dart';
import 'package:todo/data/repositories/repository.dart';
import 'package:todo/data/repositories/repository_impl.dart';
import 'package:todo/domain/usecases/get_tasks.dart';

final sl = GetIt.instance;

init() async {
  //=======================
  // Blocs
  //=======================

  //=======================
  // Use cases
  //=======================
  sl.registerLazySingleton(() => GetTasksUseCase(repository: sl()));

  //=======================
  // Repositories
  //=======================
  sl.registerLazySingleton<Repository>(
      () => RepositoryImpl(remoteDataSource: sl()));

  //=======================
  // DataSource
  //=======================
  sl.registerLazySingleton<DataSource>(() => DataSourceImpl(api: sl()));

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

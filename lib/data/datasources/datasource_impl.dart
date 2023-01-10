import 'package:todo/core/app/ap_server.dart';
import 'package:todo/core/app/center_api.dart';
import 'package:todo/core/utils/exceptions.dart';
import 'package:todo/data/datasources/datasource.dart';
import 'package:todo/data/model/task_model.dart';

class DataSourceImpl extends DataSource {
  final CenterApi api;

  DataSourceImpl({required this.api});

  @override
  Future<TaskModel> getTasks() async {
    try {
      /*final response = await api.get(
        urlSpecific:
            APServer.getTasks(GlobalStore.instance.apiToken),
      );*/
      final response = await api.get(
        urlSpecific: APServer.getTasks(),
      );
      if (response.isSuccess) {
        final body = response.result;
        return TaskModel.fromJson(body);
      } else {
        throw GeneralException(response.message ?? "Ocurrió un error general");
      }
    } catch (e) {
      throw GeneralException(e.toString());
    }
  }
}

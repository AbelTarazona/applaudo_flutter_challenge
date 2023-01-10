import 'package:todo/data/model/task_model.dart';

abstract class DataSource {
  Future<TaskModel> getTasks();
}

import 'package:todo/data/model/task_model.dart';

abstract class DataSource {
  Future<TaskModel> getTasks();
  Future<String> addTask(String date, String title);
}

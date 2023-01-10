import 'package:todo/data/model/task_model.dart';
import 'package:todo/domain/entities/task_todo.dart';

extension TaskX on DocumentModel {
  TaskToDo toEntity() => TaskToDo(
      title: fields.name.stringValue,
      date: fields.date.integerValue,
      isDone: fields.isCompleted.booleanValue);
}

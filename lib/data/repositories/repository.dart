import 'package:dartz/dartz.dart';
import 'package:todo/core/app/failure.dart';
import 'package:todo/domain/entities/task_todo.dart';

abstract class Repository {
  Future<Either<Failure, List<TaskToDo>>> getTasks();
  Future<Either<Failure, String>> addTask(String date, String title);
}

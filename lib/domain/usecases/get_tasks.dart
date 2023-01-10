import 'package:dartz/dartz.dart';
import 'package:todo/core/app/failure.dart';
import 'package:todo/core/app/use_cases.dart';
import 'package:todo/data/repositories/repository.dart';
import 'package:todo/domain/entities/task_todo.dart';

class GetTasksUseCase extends UseCase<List<TaskToDo>, NoParams> {

  final Repository repository;

  GetTasksUseCase({required this.repository});

  @override
  Future<Either<Failure, List<TaskToDo>>> call(NoParams params) {
    return repository.getTasks();
  }
}

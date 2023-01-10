import 'package:dartz/dartz.dart';
import 'package:todo/core/app/failure.dart';
import 'package:todo/core/app/use_cases.dart';
import 'package:todo/data/repositories/repository.dart';

class AddTaskParams {
  final String title;
  final String date;

  const AddTaskParams({
    required this.title,
    required this.date,
  });
}

class AddTaskUseCase extends UseCase<String, AddTaskParams> {
  final Repository repository;

  AddTaskUseCase({required this.repository});

  @override
  Future<Either<Failure, String>> call(AddTaskParams params) {
    return repository.addTask(params.date, params.title);
  }
}

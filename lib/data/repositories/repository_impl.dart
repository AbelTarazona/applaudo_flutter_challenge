import 'package:dartz/dartz.dart';
import 'package:todo/core/app/failure.dart';
import 'package:todo/core/utils/exceptions.dart';
import 'package:todo/data/datasources/datasource.dart';
import 'package:todo/data/mappers/remote_to_entity_mapper.dart';
import 'package:todo/data/repositories/repository.dart';
import 'package:todo/domain/entities/task_todo.dart';

class RepositoryImpl extends Repository {
  final DataSource remoteDataSource;

  RepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<TaskToDo>>> getTasks() async {
    try {
      final data = await remoteDataSource.getTasks();
      return Right(data.documents.map((e) => e.toEntity()).toList());
    } on GeneralException catch (e) {
      return Left(GeneralFailure(e.msg));
    }
  }
}

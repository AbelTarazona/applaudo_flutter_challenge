part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();
}

class GetTasks extends TaskEvent {
  @override
  List<Object?> get props => [];
}
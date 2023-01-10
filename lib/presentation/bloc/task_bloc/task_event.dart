part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();
}

class GetTasks extends TaskEvent {
  @override
  List<Object?> get props => [];
}

class UpdateTask extends TaskEvent {
  final TaskToDo task;
  const UpdateTask({
    required this.task,
  });

  @override
  List<Object> get props => [task];
}
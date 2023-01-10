part of 'task_bloc.dart';

class TaskState extends Equatable {
  final List<TaskToDo> pendingTasks;
  final List<TaskToDo> completedTasks;

  const TaskState(
      {this.pendingTasks = const [], this.completedTasks = const []});

  @override
  List<Object?> get props => [pendingTasks, completedTasks];
}

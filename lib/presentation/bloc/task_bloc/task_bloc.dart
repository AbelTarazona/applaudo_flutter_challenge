import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo/core/app/failure.dart';
import 'package:todo/core/app/use_cases.dart';
import 'package:todo/domain/entities/task_todo.dart';
import 'package:todo/domain/usecases/get_tasks.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final GetTasksUseCase getTasksUseCase;

  TaskBloc({required this.getTasksUseCase}) : super(const TaskState()) {
    on<GetTasks>(_onGetTasks);
    on<UpdateTask>(_onUpdateTask);
  }

  FutureOr<void> _onGetTasks(GetTasks event, Emitter<TaskState> emit) async {
    final res = await getTasksUseCase(NoParams());

    res.fold((l) => log((l as GeneralFailure).msg), (tasks) {
      List<TaskToDo> pendingList =
          tasks.where((element) => element.isComplete == false).toList();

      List<TaskToDo> completeList =
          tasks.where((element) => element.isComplete).toList();

      emit(TaskState(pendingTasks: pendingList, completedTasks: completeList));
    });
  }

  FutureOr<void> _onUpdateTask(UpdateTask event, Emitter<TaskState> emit) {
    final task = event.task;

    List<TaskToDo> pendingList = state.pendingTasks;
    List<TaskToDo> completeList = state.completedTasks;

    if (!task.isComplete) {
      pendingList = List.from(pendingList)..remove(task);
      completeList.insert(0, task.copyWith(isComplete: true));
    } else {
      completeList = List.from(completeList)..remove(task);
      pendingList = List.from(pendingList)
        ..insert(0, task.copyWith(isComplete: false));
    }

    emit(TaskState(pendingTasks: pendingList, completedTasks: completeList));
  }
}

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
  }

  FutureOr<void> _onGetTasks(GetTasks event, Emitter<TaskState> emit) async {
    final res = await getTasksUseCase(NoParams());

    res.fold((l) => log((l as GeneralFailure).msg), (tasks) {
      List<TaskToDo> pendingList =
          tasks.where((element) => element.isDone == false).toList();

      List<TaskToDo> completeList =
          tasks.where((element) => element.isDone).toList();

      emit(TaskState(pendingTasks: pendingList, completedTasks: completeList));
    });
  }
}

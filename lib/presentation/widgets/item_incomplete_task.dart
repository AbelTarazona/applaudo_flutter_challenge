import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/app/ap_colors.dart';
import 'package:todo/core/utils/spacer.dart';
import 'package:todo/core/widgets/ap_checkbox.dart';
import 'package:todo/domain/entities/task_todo.dart';
import 'package:todo/presentation/bloc/task_bloc/task_bloc.dart';

class ItemIncompleteTask extends StatelessWidget {
  final TaskToDo task;

  const ItemIncompleteTask({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        APCheckbox(
            onChanged: (val) {
              context.read<TaskBloc>().add(UpdateTask(task: task));
            },
            value: task.isComplete),
        const HSpacer(16),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task.title,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              const VSpacer(4),
              const Text(
                'Category',
                style: TextStyle(
                    color: APColors.ghost, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        )
      ],
    );
  }
}

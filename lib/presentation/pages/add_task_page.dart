import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/app/ap_colors.dart';
import 'package:todo/core/app/navigator.dart';
import 'package:todo/core/utils/spacer.dart';
import 'package:todo/domain/entities/task_todo.dart';
import 'package:todo/presentation/bloc/task_bloc/task_bloc.dart';

class AddTaskPage extends StatelessWidget {
  TextEditingController titleController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  AddTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 38, bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  AppNavigator.pop();
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(APColors.smoke),
                    foregroundColor:
                        MaterialStateProperty.all(APColors.dodgerBlue),
                    elevation: MaterialStateProperty.all(0)),
                label: const Text(
                  'To go back',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
                icon: const Icon(
                  Icons.arrow_back,
                  color: APColors.dodgerBlue,
                  size: 20,
                ),
              ),
              const VSpacer(16),
              const Text(
                'New Task',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 32),
              ),
              const VSpacer(8),
              Divider(
                color: Colors.black.withOpacity(0.03),
              ),
              const VSpacer(15),
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  filled: true,
                  labelText: 'Title',
                ),
              ),
              const VSpacer(16),
              TextFormField(
                controller: categoryController,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  filled: true,
                  labelText: 'Category',
                ),
              ),
              const VSpacer(16),
              TextFormField(
                controller: dateController,
                decoration: const InputDecoration(
                  filled: true,
                  border: UnderlineInputBorder(),
                  labelText: 'When?',
                ),
              ),
              const VSpacer(16),
              Center(
                  child: ElevatedButton(
                onPressed: () {
                  context.read<TaskBloc>().add(AddTask(
                      task: TaskToDo(
                          title: titleController.text, date: '', isComplete: false)));
                  AppNavigator.pop();
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(APColors.dodgerBlue)),
                child: const Text('Add'),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

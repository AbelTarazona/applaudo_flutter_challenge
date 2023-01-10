import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/app/ap_colors.dart';
import 'package:todo/core/app/navigator.dart';
import 'package:todo/core/utils/formatter.dart';
import 'package:todo/core/utils/mock.dart';
import 'package:todo/core/utils/screen.dart';
import 'package:todo/core/utils/spacer.dart';
import 'package:todo/domain/entities/task_todo.dart';
import 'package:todo/presentation/bloc/task_bloc/task_bloc.dart';
import 'package:todo/presentation/empty_list.dart';
import 'package:todo/presentation/widgets/item_complete_task.dart';
import 'package:todo/presentation/widgets/item_incomplete_task.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    BlocProvider.of<TaskBloc>(context).add(GetTasks());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        List<TaskToDo> pendingList = state.pendingTasks;
        List<TaskToDo> completeList = state.completedTasks;
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              AppNavigator.push(Routes.ADD_TASK);
            },
            backgroundColor: APColors.dodgerBlue,
            elevation: 0,
            child: const Icon(Icons.add),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 38, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        Formatter.instance.dateFormatUtil(
                          dateTime: DateTime.now(),
                          typeFormat: TypeFormat.mainDate,
                        ),
                        style: const TextStyle(
                            color: APColors.licorice,
                            fontSize: 32,
                            fontWeight: FontWeight.w700),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: APColors.dodgerBlue,
                        ),
                        splashRadius: 20,
                      ),
                      const Spacer(),
                      Image.network(
                        Mock.profileImage,
                        width: ScreenSize.width(context) * 0.13,
                        height: ScreenSize.width(context) * 0.13,
                      )
                    ],
                  ),
                  const VSpacer(4),
                  Text(
                    '${pendingList.length} incomplete, ${completeList.length} completed',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const VSpacer(16),
                  Divider(
                    color: Colors.black.withOpacity(0.03),
                  ),
                  const VSpacer(16),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Incomplete',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                          ),
                          const VSpacer(16),
                          if (pendingList.isEmpty)
                            const EmptyList(title: 'Empty incomplete list'),
                          ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, pos) {
                                return ItemIncompleteTask(
                                  task: pendingList[pos],
                                );
                              },
                              separatorBuilder: (context, pos) {
                                return const VSpacer(16);
                              },
                              itemCount: pendingList.length),
                          const VSpacer(32),
                          const Text(
                            'Completed',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                          ),
                          const VSpacer(16),
                          if (completeList.isEmpty)
                            const EmptyList(
                                title: 'Empty complete list'),
                          ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, pos) {
                                return ItemCompleteTask(
                                    task: completeList[pos]);
                              },
                              separatorBuilder: (context, pos) {
                                return const VSpacer(16);
                              },
                              itemCount: completeList.length)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

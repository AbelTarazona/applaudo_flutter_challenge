import 'package:flutter/material.dart';
import 'package:todo/core/app/ap_colors.dart';
import 'package:todo/core/utils/formatter.dart';
import 'package:todo/core/utils/mock.dart';
import 'package:todo/core/utils/screen.dart';
import 'package:todo/core/utils/spacer.dart';
import 'package:todo/presentation/widgets/item_complete_task.dart';
import 'package:todo/presentation/widgets/item_incomplete_task.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: APColors.dodgerBlue,
        elevation: 0,
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 38, bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                   Text(
                    Formatter.instance
                        .dateFormatUtil(
                      dateTime: DateTime.now(),
                      typeFormat:
                      TypeFormat.mainDate,
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
              const Text(
                '5 incomplete, 5 completed',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const VSpacer(16),
              Divider(
                color: Colors.black.withOpacity(0.3),
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
                      ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, pos) {
                            return ItemIncompleteTask(
                              title: Mock.incompleteTasks[pos].title,
                              category: Mock.incompleteTasks[pos].category,
                            );
                          },
                          separatorBuilder: (context, pos) {
                            return const VSpacer(16);
                          },
                          itemCount: Mock.incompleteTasks.length),
                      const VSpacer(32),
                      const Text(
                        'Completed',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                      const VSpacer(16),
                      ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, pos) {
                            return ItemCompleteTask(
                                title: Mock.completeTasks[pos].title);
                          },
                          separatorBuilder: (context, pos) {
                            return const VSpacer(16);
                          },
                          itemCount: Mock.completeTasks.length)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

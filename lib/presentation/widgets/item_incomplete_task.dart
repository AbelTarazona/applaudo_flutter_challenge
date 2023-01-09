import 'package:flutter/material.dart';
import 'package:todo/core/app/ap_colors.dart';
import 'package:todo/core/utils/spacer.dart';
import 'package:todo/core/widgets/ap_checkbox.dart';

class ItemIncompleteTask extends StatelessWidget {
  final String title;
  final String category;

  const ItemIncompleteTask(
      {Key? key, required this.title, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        APCheckbox(onChanged: (val) {}, value: false),
        const HSpacer(16),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              const VSpacer(4),
              Text(
                category,
                style: const TextStyle(
                    color: APColors.ghost, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        )
      ],
    );
  }
}

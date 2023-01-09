import 'package:flutter/material.dart';
import 'package:todo/core/app/ap_colors.dart';
import 'package:todo/core/utils/spacer.dart';
import 'package:todo/core/widgets/ap_checkbox.dart';

class ItemCompleteTask extends StatelessWidget {
  final String title;

  const ItemCompleteTask({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        APCheckbox(onChanged: (val) {}, value: true),
        const HSpacer(16),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w500, color: APColors.ghost),
          ),
        )
      ],
    );
  }
}

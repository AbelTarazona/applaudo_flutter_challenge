import 'package:flutter/material.dart';
import 'package:todo/core/app/ap_colors.dart';

class APCheckbox extends StatelessWidget {
  final Function(bool?) onChanged;
  final bool value;

  const APCheckbox({Key? key, required this.onChanged, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      onChanged: onChanged,
      side: const BorderSide(color: APColors.gainsboro, width: 2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
    );
  }
}

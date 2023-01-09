import 'package:flutter/material.dart';
import 'package:todo/core/app/ap_colors.dart';

class AlwaysActiveBorderSide extends MaterialStateBorderSide {
  @override
  BorderSide? resolve(_) => const BorderSide(color: APColors.gainsboro, width: 2);
}
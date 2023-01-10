import 'package:flutter/material.dart';
import 'package:todo/core/utils/spacer.dart';

class EmptyList extends StatelessWidget {

  final String title;

  const EmptyList({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.info),
          VSpacer(5),
          Text(title)
        ],
      ),
    );
  }
}

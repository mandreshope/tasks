import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    required this.title,
    this.onTap,
    this.isComleted = false,
    super.key,
  });
  final String title;
  final bool isComleted;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: isComleted
            ? const TextStyle(decoration: TextDecoration.lineThrough)
            : null,
      ),
      onTap: onTap,
    );
  }
}

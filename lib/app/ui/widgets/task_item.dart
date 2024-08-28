import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    required this.title,
    this.onTap,
    this.isComleted = false,
    this.toogleState,
    super.key,
  });
  final String title;
  final bool isComleted;
  final void Function()? onTap;
  final void Function()? toogleState;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        onPressed: toogleState,
        icon: Icon(isComleted ? Icons.check : Icons.radio_button_off),
      ),
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

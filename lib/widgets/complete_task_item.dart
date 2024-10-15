import 'package:flutter/material.dart';
import 'package:to_do_app/models/task_model.dart';

class CompleteTaskItem extends StatelessWidget {
  const CompleteTaskItem({super.key, required this.task});

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[350],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title: Text(
              task.task,
              style: const TextStyle(
                fontSize: 22,
                color: Colors.black,
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                task.content,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black.withOpacity(.5),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 25),
            child: Row(
              children: [
                Text(
                  task.date,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black.withOpacity(.4),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

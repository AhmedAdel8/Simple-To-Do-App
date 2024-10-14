import 'package:flutter/material.dart';
import 'package:to_do_app/models/task_model.dart';
import 'package:to_do_app/widgets/edit_task_body.dart';

class EditTaskScreen extends StatelessWidget {
  const EditTaskScreen({super.key, required this.task});

  final TaskModel task;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          'Edit Task',
        ),
      ),
      body: EditTaskScreenBody(
        task: task,
      ),
    );
  }
}

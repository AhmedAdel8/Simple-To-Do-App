import 'package:flutter/material.dart';
import 'package:to_do_app/screens/complete_tasks_screen.dart';
import 'package:to_do_app/widgets/add_task_bottom_sheet.dart';
import 'package:to_do_app/widgets/task_screen_body.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          'Task Manager',
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const CompleteTasksScreen();
                  },
                ),
              );
            },
            icon: const Icon(
              Icons.archive,
              color: Colors.black,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: Colors.blue,
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return const AddTaskBottomSheet();
            },
          );
        },
        child: const Icon(
          Icons.add,
          //size: 30,
        ),
      ),
      body: const TaskScreenBody(),
    );
  }
}

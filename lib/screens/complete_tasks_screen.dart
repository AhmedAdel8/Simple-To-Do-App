import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/cubits/complete_task_cubit/archieve_task_cubit.dart';
import 'package:to_do_app/widgets/complete_item_list_view.dart';

class CompleteTasksScreen extends StatefulWidget {
  const CompleteTasksScreen({super.key});

  @override
  State<CompleteTasksScreen> createState() => _CompleteTasksScreenState();
}

class _CompleteTasksScreenState extends State<CompleteTasksScreen> {
  @override
  void initState() {
    BlocProvider.of<ArchieveTaskCubit>(context).fetchAllCompletedTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          'Complete Tasks',
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.archive,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: const CompleteTaskListView(),
    );
  }
}

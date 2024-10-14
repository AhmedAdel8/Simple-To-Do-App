import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/cubits/task_cubit/task_cubit.dart';
import 'package:to_do_app/widgets/tasks_list_view.dart';

class TaskScreenBody extends StatefulWidget {
  const TaskScreenBody({super.key});

  @override
  State<TaskScreenBody> createState() => _TaskScreenBodyState();
}

class _TaskScreenBodyState extends State<TaskScreenBody> {
  @override
  void initState() {
    BlocProvider.of<TaskCubit>(context).fetchAllTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          Expanded(
            child: TaskListView(),
          ),
        ],
      ),
    );
  }
}

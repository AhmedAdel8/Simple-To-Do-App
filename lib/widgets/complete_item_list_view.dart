import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/cubits/complete_task_cubit/archieve_task_cubit.dart';
import 'package:to_do_app/cubits/complete_task_cubit/archieve_task_state.dart';
import 'package:to_do_app/cubits/task_cubit/task_cubit.dart';
import 'package:to_do_app/models/task_model.dart';
import 'package:to_do_app/widgets/complete_task_item.dart';
import 'package:to_do_app/widgets/custom_task_item.dart';

class CompleteTaskListView extends StatelessWidget {
  const CompleteTaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    List<TaskModel> tasks =
        BlocProvider.of<ArchieveTaskCubit>(context).tasks ?? [];
    return BlocConsumer<ArchieveTaskCubit, ArchieveTaskState>(
      listener: (context, state) {
        if (state is ArchieveTaskSuccess) {
          tasks = BlocProvider.of<ArchieveTaskCubit>(context).tasks!;
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ListView.builder(
              itemCount: tasks.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: CompleteTaskItem(
                    task: tasks[index],
                  ),
                );
              }),
        );
      },
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/cubits/add_task_cubit/add_task_cubit.dart';
import 'package:to_do_app/cubits/task_cubit/task_cubit.dart';
import 'package:to_do_app/widgets/add_task_form.dart';

class AddTaskBottomSheet extends StatelessWidget {
  const AddTaskBottomSheet({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddTaskCubit(),
      child:
          BlocConsumer<AddTaskCubit, AddTasksState>(listener: (context, state) {
        if (state is AddTasksFailure) {}
        if (state is AddTasksSuccess) {
          BlocProvider.of<TaskCubit>(context).fetchAllTasks();
          Navigator.pop(context);
        }
      }, builder: (context, state) {
        return AbsorbPointer(
          absorbing: state is AddTasksLoading ? true : false,
          child: Padding(
            padding: EdgeInsets.only(
                left: 10,
                right: 10,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: const SingleChildScrollView(
              child: AddTaskForm(),
            ),
          ),
        );
      }),
    );
  }
}

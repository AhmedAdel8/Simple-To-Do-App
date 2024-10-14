import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/cubits/task_cubit/task_cubit.dart';
import 'package:to_do_app/models/task_model.dart';
import 'package:to_do_app/widgets/custom_text_field.dart';

class EditTaskScreenBody extends StatefulWidget {
  const EditTaskScreenBody({super.key, required this.task, this.onPressed});

  final TaskModel task;
  final void Function()? onPressed;

  @override
  State<EditTaskScreenBody> createState() => _EditTaskScreenBodyState();
}

class _EditTaskScreenBodyState extends State<EditTaskScreenBody> {
  String? task, content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            onChanged: (value) {
              task = value;
            },
            hint: widget.task.task,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            onChanged: (value) {
              content = value;
            },
            hint: widget.task.content,
            maxLines: 3,
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            height: 50,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: IconButton(
                onPressed: () {
                  widget.task.task = task ?? widget.task.task;
                  widget.task.content = content ?? widget.task.content;
                  widget.task.save();

                  BlocProvider.of<TaskCubit>(context).fetchAllTasks();
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.check,
                  size: 30,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/cubits/complete_task_cubit/archieve_task_cubit.dart';
import 'package:to_do_app/widgets/complete_item_list_view.dart';

class CompleteScreenBody extends StatefulWidget {
  const CompleteScreenBody({super.key});

  @override
  State<CompleteScreenBody> createState() => _CompleteScreenBodyState();
}

class _CompleteScreenBodyState extends State<CompleteScreenBody> {
  @override
  void initState() {
    BlocProvider.of<ArchieveTaskCubit>(context).fetchAllCompletedTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          Expanded(
            child: CompleteTaskListView(),
          ),
        ],
      ),
    );
  }
}

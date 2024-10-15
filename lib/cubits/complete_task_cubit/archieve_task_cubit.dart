import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/cubits/complete_task_cubit/archieve_task_state.dart';
import 'package:to_do_app/models/task_model.dart';

class ArchieveTaskCubit extends Cubit<ArchieveTaskState> {
  ArchieveTaskCubit() : super(ArchieveTaskInitial());

  List<TaskModel>? tasks;

  addCompleteTask(TaskModel task) async {
    emit(ArchieveTaskLoading());
    try {
      var completeBox = Hive.box<TaskModel>('complete_box');
      await completeBox.add(task);
      emit(ArchieveTaskSuccess());
    } catch (e) {
      print(e.toString());
      emit(ArchieveTaskFailure(errMessage: e.toString()));
    }
  }

  fetchAllCompletedTasks() async {
    var tasksBox = Hive.box<TaskModel>('complete_box');

    tasks = tasksBox.values.toList();
  }
}

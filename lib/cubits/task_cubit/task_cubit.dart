import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:to_do_app/models/task_model.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());

  List<TaskModel>? tasks;
  fetchAllTasks() async {
    var tasksBox = Hive.box<TaskModel>('tasks_box');

    tasks = tasksBox.values.toList();
    emit(TaskSuccess());
  }
}

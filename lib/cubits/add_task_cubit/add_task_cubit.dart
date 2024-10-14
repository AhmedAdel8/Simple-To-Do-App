import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:to_do_app/models/task_model.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTasksState> {
  AddTaskCubit() : super(AddTasksInitial());

  addTask(TaskModel task) async {
    emit(AddTasksLoading());
    try {
      var tasksBox = Hive.box<TaskModel>('tasks_box');
      await tasksBox.add(task);
      emit(AddTasksSuccess());
    } catch (e) {
      emit(AddTasksFailure(e.toString()));
    }
  }
}

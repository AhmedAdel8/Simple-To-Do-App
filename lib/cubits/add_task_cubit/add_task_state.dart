part of 'add_task_cubit.dart';

@immutable
sealed class AddTasksState {}

final class AddTasksInitial extends AddTasksState {}

final class AddTasksLoading extends AddTasksState {}

final class AddTasksSuccess extends AddTasksState {}

final class AddTasksFailure extends AddTasksState {
  final String errMessage;

  AddTasksFailure(this.errMessage);
}

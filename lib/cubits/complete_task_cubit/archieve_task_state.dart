abstract class ArchieveTaskState {}

class ArchieveTaskInitial extends ArchieveTaskState {}

class ArchieveTaskLoading extends ArchieveTaskState {}

class ArchieveTaskSuccess extends ArchieveTaskState {}

class ArchieveTaskFailure extends ArchieveTaskState {
  final String errMessage;

  ArchieveTaskFailure({required this.errMessage});
}

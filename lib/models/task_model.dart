import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(0)
  String task;
  @HiveField(1)
  String content;
  @HiveField(2)
  String date;

  TaskModel({
    required this.task,
    required this.content,
    required this.date,
  });
}

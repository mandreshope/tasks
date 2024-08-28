import 'package:mockito/annotations.dart';
import 'package:tasks/app/data/local/local.dart';
import 'package:tasks/app/data/models/task.dart';
import 'package:tasks/app/data/repositories/repositories.dart';

@GenerateNiceMocks([
  MockSpec<IsarService>(),
  MockSpec<IsarCollection>(),
  MockSpec<Task>(),
  MockSpec<TaskRepository>(),
  MockSpec<Isar>(),
  MockSpec<TaskDataSource>(),
])
void main() {}

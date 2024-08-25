import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/app/data/local/local.dart';
import 'package:tasks/app/data/providers/isar_service_provider.dart';
import 'package:tasks/app/data/repositories/repositories.dart';

final taskRepositoryProvider = Provider<TaskRepository>((ref) {
  return TaskRepositoryImpl(taskDataSource: ref.read(taskDataSourceProvider));
});

final taskDataSourceProvider = Provider.autoDispose<TaskDataSource>((ref) {
  return TaskDataSourceImpl(isarService: ref.read(isarServiceProvider));
});

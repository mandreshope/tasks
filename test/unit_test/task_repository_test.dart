import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tasks/app/data/mocks/mocks.mocks.dart';
import 'package:tasks/app/data/models/task.dart';
import 'package:tasks/app/data/repositories/repositories.dart';
import 'package:tasks/app/ui/states/task_view_state.dart';

void main() {
  late TaskRepositoryImpl taskRepository;
  late MockTaskDataSource mockTaskDataSource;

  setUp(() {
    mockTaskDataSource = MockTaskDataSource();
    taskRepository = TaskRepositoryImpl(taskDataSource: mockTaskDataSource);
  });

  group('TaskRepositoryImpl', () {
    test('getAll should call getAll on TaskDataSource', () async {
      final tasks = [
        Task(
          id: 1,
          title: 'Task 1',
          content: 'Content 1',
          date: DateTime.now(),
          status: Status.inProgress,
        ),
        Task(
          id: 2,
          title: 'Task 2',
          content: 'Content 2',
          date: DateTime.now(),
          status: Status.completed,
        ),
      ];

      when(mockTaskDataSource.getAll(sort: SortedBy.date))
          .thenAnswer((_) async => tasks);

      final result = await taskRepository.getAll(sort: SortedBy.date);

      expect(result, tasks);
      verify(mockTaskDataSource.getAll(sort: SortedBy.date)).called(1);
    });

    test('add should call add on TaskDataSource', () async {
      final taskDto = TaskDto(
        title: 'New Task',
        content: 'New Content',
        date: DateTime.now(),
        status: Status.inProgress,
      );

      when(mockTaskDataSource.add(task: taskDto)).thenAnswer((_) async => true);

      final result = await taskRepository.add(task: taskDto);

      expect(result, true);
      verify(mockTaskDataSource.add(task: taskDto)).called(1);
    });

    test('getAllByStatus should call getAllByStatus on TaskDataSource',
        () async {
      final tasks = [
        Task(
          id: 1,
          title: 'Task 1',
          content: 'Content 1',
          date: DateTime.now(),
          status: Status.inProgress,
        ),
      ];

      when(
        mockTaskDataSource.getAllByStatus(
          status: Status.inProgress,
          sort: SortedBy.date,
        ),
      ).thenAnswer((_) async => tasks);

      final result = await taskRepository.getAllByStatus(
        status: Status.inProgress,
        sort: SortedBy.date,
      );

      expect(result, tasks);
      verify(
        mockTaskDataSource.getAllByStatus(
          status: Status.inProgress,
          sort: SortedBy.date,
        ),
      ).called(1);
    });

    test('getTaskById should call getTaskById on TaskDataSource', () async {
      final task = Task(
        id: 1,
        title: 'Task 1',
        content: 'Content 1',
        date: DateTime.now(),
        status: Status.inProgress,
      );

      when(mockTaskDataSource.getTaskById(id: 1)).thenAnswer((_) async => task);

      final result = await taskRepository.getTaskById(id: 1);

      expect(result, task);
      verify(mockTaskDataSource.getTaskById(id: 1)).called(1);
    });

    test('markAsCompleted should call markAsCompleted on TaskDataSource',
        () async {
      when(mockTaskDataSource.markAsCompleted(id: 1))
          .thenAnswer((_) async => true);

      final result = await taskRepository.markAsCompleted(id: 1);

      expect(result, true);
      verify(mockTaskDataSource.markAsCompleted(id: 1)).called(1);
    });

    test('markAsInProgress should call markAsInProgress on TaskDataSource',
        () async {
      when(mockTaskDataSource.markAsInProgress(id: 1))
          .thenAnswer((_) async => true);

      final result = await taskRepository.markAsInProgress(id: 1);

      expect(result, true);
      verify(mockTaskDataSource.markAsInProgress(id: 1)).called(1);
    });

    test('update should call update on TaskDataSource', () async {
      final taskDto = TaskDto(
        title: 'Updated Task',
        content: 'Updated Content',
        date: DateTime.now(),
        status: Status.inProgress,
      );

      when(mockTaskDataSource.update(id: 1, taskDto: taskDto))
          .thenAnswer((_) async => true);

      final result = await taskRepository.update(id: 1, taskDto: taskDto);

      expect(result, true);
      verify(mockTaskDataSource.update(id: 1, taskDto: taskDto)).called(1);
    });

    test('delete should call delete on TaskDataSource', () async {
      when(mockTaskDataSource.delete(id: 1)).thenAnswer((_) async => true);

      final result = await taskRepository.delete(id: 1);

      expect(result, true);
      verify(mockTaskDataSource.delete(id: 1)).called(1);
    });
  });
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tasks/app/data/mocks/mocks.mocks.dart';
import 'package:tasks/app/data/models/task.dart';
import 'package:tasks/app/data/providers/providers.dart';
import 'package:tasks/app/ui/states/task_view_model.dart';
import 'package:tasks/app/ui/states/task_view_state.dart';

final task = Task(
  id: 1,
  title: 'Test',
  content: 'Content',
  date: DateTime.now(),
  status: Status.inProgress,
);
final tasks = [task];

void main() {
  late TaskViewModel viewModel;
  late MockTaskRepository mockTaskRepository;
  late ProviderContainer container;

  setUp(() {
    mockTaskRepository = MockTaskRepository();
    container = ProviderContainer(
      overrides: [
        taskRepositoryProvider.overrideWithValue(mockTaskRepository),
      ],
    );
    viewModel = container.read(taskViewModelProvider.notifier);
  });

  tearDown(() {
    container.dispose();
  });

  test('initial state is correct', () {
    expect(viewModel.state, const TaskViewState());
  });

  test('getTasks updates state on success', () async {
    when(mockTaskRepository.getAll()).thenAnswer((v) => Future.value(tasks));
    await viewModel.getTasks();
    expect(viewModel.state.status, TaskViewStatus.success);
    expect(viewModel.state.tasks, tasks);
  });

  test('getTasks updates state on failure', () async {
    when(mockTaskRepository.getAll()).thenAnswer((v) => Future.value(tasks));
    await viewModel.getTasks();
    expect(viewModel.state.status, TaskViewStatus.success);
  });

  test('getTaskByStatus updates state on success', () async {
    when(mockTaskRepository.getAllByStatus(status: Status.inProgress))
        .thenAnswer((v) => Future.value(tasks));
    await viewModel.getTaskByStatus(status: Status.inProgress);
    expect(viewModel.state.status, TaskViewStatus.success);
    expect(viewModel.state.tasks, tasks);
  });

  test('getTaskByStatus updates state on failure', () async {
    when(mockTaskRepository.getAllByStatus(status: Status.inProgress))
        .thenAnswer((v) => Future.error(tasks));
    await viewModel.getTaskByStatus(status: Status.inProgress);
    expect(viewModel.state.status, TaskViewStatus.error);
  });
}

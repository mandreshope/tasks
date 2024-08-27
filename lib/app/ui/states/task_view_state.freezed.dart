// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TaskViewState {
  TaskViewStatus get status => throw _privateConstructorUsedError;
  List<Task> get tasks => throw _privateConstructorUsedError;
  Task? get task => throw _privateConstructorUsedError;
  int get tabIndex => throw _privateConstructorUsedError;
  SortedBy get sortedBy => throw _privateConstructorUsedError;

  /// Create a copy of TaskViewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskViewStateCopyWith<TaskViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskViewStateCopyWith<$Res> {
  factory $TaskViewStateCopyWith(
          TaskViewState value, $Res Function(TaskViewState) then) =
      _$TaskViewStateCopyWithImpl<$Res, TaskViewState>;
  @useResult
  $Res call(
      {TaskViewStatus status,
      List<Task> tasks,
      Task? task,
      int tabIndex,
      SortedBy sortedBy});
}

/// @nodoc
class _$TaskViewStateCopyWithImpl<$Res, $Val extends TaskViewState>
    implements $TaskViewStateCopyWith<$Res> {
  _$TaskViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskViewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? tasks = null,
    Object? task = freezed,
    Object? tabIndex = null,
    Object? sortedBy = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TaskViewStatus,
      tasks: null == tasks
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
      task: freezed == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as Task?,
      tabIndex: null == tabIndex
          ? _value.tabIndex
          : tabIndex // ignore: cast_nullable_to_non_nullable
              as int,
      sortedBy: null == sortedBy
          ? _value.sortedBy
          : sortedBy // ignore: cast_nullable_to_non_nullable
              as SortedBy,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskViewStateImplCopyWith<$Res>
    implements $TaskViewStateCopyWith<$Res> {
  factory _$$TaskViewStateImplCopyWith(
          _$TaskViewStateImpl value, $Res Function(_$TaskViewStateImpl) then) =
      __$$TaskViewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TaskViewStatus status,
      List<Task> tasks,
      Task? task,
      int tabIndex,
      SortedBy sortedBy});
}

/// @nodoc
class __$$TaskViewStateImplCopyWithImpl<$Res>
    extends _$TaskViewStateCopyWithImpl<$Res, _$TaskViewStateImpl>
    implements _$$TaskViewStateImplCopyWith<$Res> {
  __$$TaskViewStateImplCopyWithImpl(
      _$TaskViewStateImpl _value, $Res Function(_$TaskViewStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskViewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? tasks = null,
    Object? task = freezed,
    Object? tabIndex = null,
    Object? sortedBy = null,
  }) {
    return _then(_$TaskViewStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TaskViewStatus,
      tasks: null == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
      task: freezed == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as Task?,
      tabIndex: null == tabIndex
          ? _value.tabIndex
          : tabIndex // ignore: cast_nullable_to_non_nullable
              as int,
      sortedBy: null == sortedBy
          ? _value.sortedBy
          : sortedBy // ignore: cast_nullable_to_non_nullable
              as SortedBy,
    ));
  }
}

/// @nodoc

class _$TaskViewStateImpl implements _TaskViewState {
  const _$TaskViewStateImpl(
      {this.status = TaskViewStatus.init,
      final List<Task> tasks = const [],
      this.task = null,
      this.tabIndex = 0,
      this.sortedBy = SortedBy.date})
      : _tasks = tasks;

  @override
  @JsonKey()
  final TaskViewStatus status;
  final List<Task> _tasks;
  @override
  @JsonKey()
  List<Task> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  @override
  @JsonKey()
  final Task? task;
  @override
  @JsonKey()
  final int tabIndex;
  @override
  @JsonKey()
  final SortedBy sortedBy;

  @override
  String toString() {
    return 'TaskViewState(status: $status, tasks: $tasks, task: $task, tabIndex: $tabIndex, sortedBy: $sortedBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskViewStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._tasks, _tasks) &&
            (identical(other.task, task) || other.task == task) &&
            (identical(other.tabIndex, tabIndex) ||
                other.tabIndex == tabIndex) &&
            (identical(other.sortedBy, sortedBy) ||
                other.sortedBy == sortedBy));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status,
      const DeepCollectionEquality().hash(_tasks), task, tabIndex, sortedBy);

  /// Create a copy of TaskViewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskViewStateImplCopyWith<_$TaskViewStateImpl> get copyWith =>
      __$$TaskViewStateImplCopyWithImpl<_$TaskViewStateImpl>(this, _$identity);
}

abstract class _TaskViewState implements TaskViewState {
  const factory _TaskViewState(
      {final TaskViewStatus status,
      final List<Task> tasks,
      final Task? task,
      final int tabIndex,
      final SortedBy sortedBy}) = _$TaskViewStateImpl;

  @override
  TaskViewStatus get status;
  @override
  List<Task> get tasks;
  @override
  Task? get task;
  @override
  int get tabIndex;
  @override
  SortedBy get sortedBy;

  /// Create a copy of TaskViewState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskViewStateImplCopyWith<_$TaskViewStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

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
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TaskViewStatus status) status,
    required TResult Function(List<Task> tasks) tasks,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TaskViewStatus status)? status,
    TResult? Function(List<Task> tasks)? tasks,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TaskViewStatus status)? status,
    TResult Function(List<Task> tasks)? tasks,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskStatus value) status,
    required TResult Function(Tasks value) tasks,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskStatus value)? status,
    TResult? Function(Tasks value)? tasks,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskStatus value)? status,
    TResult Function(Tasks value)? tasks,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskViewStateCopyWith<$Res> {
  factory $TaskViewStateCopyWith(
          TaskViewState value, $Res Function(TaskViewState) then) =
      _$TaskViewStateCopyWithImpl<$Res, TaskViewState>;
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
}

/// @nodoc
abstract class _$$TaskStatusImplCopyWith<$Res> {
  factory _$$TaskStatusImplCopyWith(
          _$TaskStatusImpl value, $Res Function(_$TaskStatusImpl) then) =
      __$$TaskStatusImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TaskViewStatus status});
}

/// @nodoc
class __$$TaskStatusImplCopyWithImpl<$Res>
    extends _$TaskViewStateCopyWithImpl<$Res, _$TaskStatusImpl>
    implements _$$TaskStatusImplCopyWith<$Res> {
  __$$TaskStatusImplCopyWithImpl(
      _$TaskStatusImpl _value, $Res Function(_$TaskStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskViewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_$TaskStatusImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TaskViewStatus,
    ));
  }
}

/// @nodoc

class _$TaskStatusImpl implements TaskStatus {
  const _$TaskStatusImpl({this.status = TaskViewStatus.init});

  @override
  @JsonKey()
  final TaskViewStatus status;

  @override
  String toString() {
    return 'TaskViewState.status(status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskStatusImpl &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  /// Create a copy of TaskViewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskStatusImplCopyWith<_$TaskStatusImpl> get copyWith =>
      __$$TaskStatusImplCopyWithImpl<_$TaskStatusImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TaskViewStatus status) status,
    required TResult Function(List<Task> tasks) tasks,
  }) {
    return status(this.status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TaskViewStatus status)? status,
    TResult? Function(List<Task> tasks)? tasks,
  }) {
    return status?.call(this.status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TaskViewStatus status)? status,
    TResult Function(List<Task> tasks)? tasks,
    required TResult orElse(),
  }) {
    if (status != null) {
      return status(this.status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskStatus value) status,
    required TResult Function(Tasks value) tasks,
  }) {
    return status(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskStatus value)? status,
    TResult? Function(Tasks value)? tasks,
  }) {
    return status?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskStatus value)? status,
    TResult Function(Tasks value)? tasks,
    required TResult orElse(),
  }) {
    if (status != null) {
      return status(this);
    }
    return orElse();
  }
}

abstract class TaskStatus implements TaskViewState {
  const factory TaskStatus({final TaskViewStatus status}) = _$TaskStatusImpl;

  TaskViewStatus get status;

  /// Create a copy of TaskViewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskStatusImplCopyWith<_$TaskStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TasksImplCopyWith<$Res> {
  factory _$$TasksImplCopyWith(
          _$TasksImpl value, $Res Function(_$TasksImpl) then) =
      __$$TasksImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Task> tasks});
}

/// @nodoc
class __$$TasksImplCopyWithImpl<$Res>
    extends _$TaskViewStateCopyWithImpl<$Res, _$TasksImpl>
    implements _$$TasksImplCopyWith<$Res> {
  __$$TasksImplCopyWithImpl(
      _$TasksImpl _value, $Res Function(_$TasksImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskViewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tasks = null,
  }) {
    return _then(_$TasksImpl(
      tasks: null == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
    ));
  }
}

/// @nodoc

class _$TasksImpl implements Tasks {
  const _$TasksImpl({final List<Task> tasks = const <Task>[]}) : _tasks = tasks;

  final List<Task> _tasks;
  @override
  @JsonKey()
  List<Task> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  @override
  String toString() {
    return 'TaskViewState.tasks(tasks: $tasks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TasksImpl &&
            const DeepCollectionEquality().equals(other._tasks, _tasks));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_tasks));

  /// Create a copy of TaskViewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TasksImplCopyWith<_$TasksImpl> get copyWith =>
      __$$TasksImplCopyWithImpl<_$TasksImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TaskViewStatus status) status,
    required TResult Function(List<Task> tasks) tasks,
  }) {
    return tasks(this.tasks);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TaskViewStatus status)? status,
    TResult? Function(List<Task> tasks)? tasks,
  }) {
    return tasks?.call(this.tasks);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TaskViewStatus status)? status,
    TResult Function(List<Task> tasks)? tasks,
    required TResult orElse(),
  }) {
    if (tasks != null) {
      return tasks(this.tasks);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TaskStatus value) status,
    required TResult Function(Tasks value) tasks,
  }) {
    return tasks(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TaskStatus value)? status,
    TResult? Function(Tasks value)? tasks,
  }) {
    return tasks?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TaskStatus value)? status,
    TResult Function(Tasks value)? tasks,
    required TResult orElse(),
  }) {
    if (tasks != null) {
      return tasks(this);
    }
    return orElse();
  }
}

abstract class Tasks implements TaskViewState {
  const factory Tasks({final List<Task> tasks}) = _$TasksImpl;

  List<Task> get tasks;

  /// Create a copy of TaskViewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TasksImplCopyWith<_$TasksImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

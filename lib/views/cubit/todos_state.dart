part of 'todos_cubit.dart';

@immutable
abstract class TodosState {}

final class TodosInitial extends TodosState {}

final class TodosLoading extends TodosState {}

final class TodosSuccess extends TodosState {}

final class TodosError extends TodosState {}


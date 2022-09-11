part of 'users_bloc.dart';

@immutable
abstract class UsersState {}

class UsersInitial extends UsersState {
  final List<UserModels> userModels = [];
}

class UsersLoaded extends UsersState {
  final List<UserModels> userModels;

  UsersLoaded({this.userModels = const <UserModels>[]});
}

class UserLoading extends UsersState {}

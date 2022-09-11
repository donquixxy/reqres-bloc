part of 'users_bloc.dart';

@immutable
abstract class UsersEvent {
  final userProvider = UserProvider();
  final repository = UserRepository();
}

class LoadUser extends UsersEvent {}

class ErrorLoadUser extends UsersEvent {}

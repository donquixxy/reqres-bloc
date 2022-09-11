part of 'users_bloc.dart';

@immutable
abstract class UsersEvent {}

class LoadUser extends UsersEvent {
  final _repository = UserRepository();

  Future<List<UserModels>?> getAllUser() async {
    try {
      var response = await _repository.getAllUser();
      return response;
    } catch (e) {
      return null;
    }
  }
}

class ErrorLoadUser extends UsersEvent {}

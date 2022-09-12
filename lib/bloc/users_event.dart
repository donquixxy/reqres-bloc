part of 'users_bloc.dart';

@immutable
abstract class UsersEvent {
  final _repository = UserRepository();
}

class LoadUser extends UsersEvent {
  Future<List<UserModels>?> getAllUser([int pageCounter = 1]) async {
    try {
      List<UserModels> temp = [];
      var response = await _repository.getAllUser(pageCounter);
      pageCounter = pageCounter + 1;

      for (var data in response!.data) {
        temp.add(data);
      }

      if (temp.length < response.total) {
        var moreData = await _repository.getAllUser(pageCounter);
        log('masuk');
        for (var moreResults in moreData!.data) {
          temp.add(moreResults);
        }
      }

      return temp;
    } catch (e) {
      return null;
    }
  }
}

class ErrorLoadUser extends UsersEvent {}

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/models/user_models.dart';
import 'package:flutter_application_1/providers/user_providers.dart';

@immutable
abstract class Repository {
  final _userProvider = UserProvider();
  Future<List<UserModels>?> getAllUser();
  Future<UserModels?> getSingleUser();
}

class UserRepository extends Repository {
  @override
  Future<List<UserModels>?> getAllUser() async {
    try {
      var response = await _userProvider.getAllUsers();
      return response;
    } catch (error) {
      return null;
    }
  }

  @override
  Future<UserModels?> getSingleUser() {
    // TODO: implement getSingleUser
    throw UnimplementedError();
  }
}

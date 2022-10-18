
import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/models/user_data_models.dart';
import 'package:flutter_application_1/models/user_models.dart';
import 'package:flutter_application_1/providers/user_providers.dart';

@immutable
abstract class Repository {
  final _userProvider = UserProvider();
  Future<Either<String, UsersPage>> getAllUser([int pageInitial = 1]);
  Future<UserModels?> getSingleUser();
}

class UserRepository extends Repository {
  @override
  Future<Either<String, UsersPage>> getAllUser([int pageInitial = 1]) async {
    try {
      var response = await _userProvider.getAllUsers(pageInitial);
      return Right(response.right);
    } catch (error) {
      return Left('Failed To fetch');
    }
  }

  @override
  Future<UserModels?> getSingleUser() {
    // TODO: implement getSingleUser
    throw UnimplementedError();
  }
}

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_application_1/models/user_data_models.dart';
import 'package:flutter_application_1/models/user_models.dart';

class UserProvider {
  UserProvider._instance();

  static final UserProvider _userProviderInstance = UserProvider._instance();

  factory UserProvider() {
    return _userProviderInstance;
  }

  Dio dio = Dio();
  final String baseUrl = 'https://reqres.in/api/users';

  Future<Either<String, UsersPage>> getAllUsers(int page) async {
    try {
      var response = await dio.get(
        baseUrl,
        queryParameters: {'page': page},
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to fetch Data, no data found');
      }

      UsersPage usersPage = UsersPage.fromJson(response.data);

      return Right(usersPage);
    } on Exception catch (e) {
      return Left(e.toString());
    }
  }
}

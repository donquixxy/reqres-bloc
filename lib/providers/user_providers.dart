import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_application_1/models/user_models.dart';

class UserProvider {
  UserProvider._instance();

  static final UserProvider _userProviderInstance = UserProvider._instance();

  factory UserProvider() {
    return _userProviderInstance;
  }

  Dio dio = Dio();
  final String baseUrl = 'https://reqres.in/api/users?page=2';

  Future<List<UserModels>?> getAllUsers() async {
    try {
      List<UserModels> temp = [];
      var response = await dio.get(baseUrl);

      if (response.statusCode != 200) {
        throw Exception('Failed to fetch Data');
      }

      for (var data in response.data['data']) {
        UserModels models = UserModels.fromJson(data);
        temp.add(models);
      }

      return temp;
    } catch (e) {
      // TODO
    }
  }
}

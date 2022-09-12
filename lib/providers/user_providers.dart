import 'package:dio/dio.dart';
import 'package:flutter_application_1/models/user_data_models.dart';

class UserProvider {
  UserProvider._instance();

  static final UserProvider _userProviderInstance = UserProvider._instance();

  factory UserProvider() {
    return _userProviderInstance;
  }

  Dio dio = Dio();
  final String baseUrl = 'https://reqres.in/api/users';

  Future<UsersPage?> getAllUsers(int page) async {
    try {
      var response = await dio.get(baseUrl, queryParameters: {'page': page});

      if (response.statusCode != 200) {
        throw Exception('Failed to fetch Data');
      }

      return UsersPage.fromJson(response.data);

      // for (var data in response.data['data']) {
      //   UserModels models = UserModels.fromJson(data);
      //   temp.add(models);
      // }

      // return temp;
    } catch (e) {
      return null;
    }
  }
}

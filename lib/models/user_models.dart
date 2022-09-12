// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'user_models.g.dart';

@JsonSerializable()
class UserModels {
  final int id;
  final String email;
  final String first_name;
  final String last_name;
  final String avatar;

  UserModels(
      {required this.id,
      required this.email,
      required this.first_name,
      required this.last_name,
      required this.avatar});

  factory UserModels.fromJson(Map<String, dynamic> json) =>
      _$UserModelsFromJson(json);
}

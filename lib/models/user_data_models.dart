// ignore_for_file: non_constant_identifier_names

import 'package:flutter_application_1/models/user_models.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_data_models.g.dart';

@JsonSerializable()
class UsersPage {
  final int page;
  final int per_page;
  final int total;
  final int total_pages;
  final List<UserModels> data;

  UsersPage(
      {required this.page,
      required this.per_page,
      required this.total,
      required this.total_pages,
      required this.data});

  factory UsersPage.fromJson(Map<String, dynamic> json) =>
      _$UsersPageFromJson(json);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: unused_element

part of 'user_data_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersPage _$UsersPageFromJson(Map<String, dynamic> json) => UsersPage(
      page: json['page'] as int,
      per_page: json['per_page'] as int,
      total: json['total'] as int,
      total_pages: json['total_pages'] as int,
      data: (json['data'] as List<dynamic>)
          .map((e) => UserModels.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UsersPageToJson(UsersPage instance) => <String, dynamic>{
      'page': instance.page,
      'per_page': instance.per_page,
      'total': instance.total,
      'total_pages': instance.total_pages,
      'data': instance.data,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'developer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Developer _$DeveloperFromJson(Map<String, dynamic> json) {
  return Developer(
      name: json['name'] as String,
      email: json['email'] as String,
      company: json['company'] as String,
      experience: json['experience'] as String);
}

Map<String, dynamic> _$DeveloperToJson(Developer instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'experience': instance.experience,
      'company': instance.company
    };

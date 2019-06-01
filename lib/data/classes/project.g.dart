// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Project _$ProjectFromJson(Map<String, dynamic> json) {
  return Project(
      name: json['name'] as String,
      bounty: json['bounty'] as num,
      hours: json['hours'] as int,
      openSourced: json['openSourced'] as bool,
      dateCreated: json['dateCreated'] == null
          ? null
          : DateTime.parse(json['dateCreated'] as String));
}

Map<String, dynamic> _$ProjectToJson(Project instance) => <String, dynamic>{
      'name': instance.name,
      'openSourced': instance.openSourced,
      'hours': instance.hours,
      'bounty': instance.bounty,
      'dateCreated': instance.dateCreated?.toIso8601String()
    };

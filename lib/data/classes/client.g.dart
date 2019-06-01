// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Client _$ClientFromJson(Map<String, dynamic> json) {
  return Client(
      name: json['name'] as String,
      email: json['email'] as String,
      company: json['company'] as String,
      industry: json['industry'] as String);
}

Map<String, dynamic> _$ClientToJson(Client instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'industry': instance.industry,
      'company': instance.company
    };

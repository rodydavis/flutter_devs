import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

part 'developer.g.dart';

@JsonSerializable()
class Developer {
  Developer({
    @required this.name,
    this.email,
    this.company,
    this.experience,
  });

  final String name;
  final String email;
  final String experience;
  final String company;

  factory Developer.fromJson(Map<String, dynamic> json) =>
      _$DeveloperFromJson(json);

  Map<String, dynamic> toJson() => _$DeveloperToJson(this);
}

import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

part 'project.g.dart';

@JsonSerializable()
class Project {
  Project({
    @required this.name,
    this.bounty,
    this.hours,
    this.openSourced,
    this.dateCreated,
  });

  final String name;
  final bool openSourced;
  final int hours;
  final num bounty;
  final DateTime dateCreated;

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectToJson(this);
}

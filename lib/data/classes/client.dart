import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

part 'client.g.dart';

@JsonSerializable()
class Client {
  Client({
    @required this.name,
    this.email,
    this.company,
    this.industry,
  });

  final String name;
  final String email;
  final String industry;
  final String company;

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);

  Map<String, dynamic> toJson() => _$ClientToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'calorie_burned.g.dart';

@JsonSerializable()
class CalorieBurned {
  final double quantity;
  final DateTime dateTime;

  CalorieBurned({
    required this.quantity,
    required this.dateTime,
  });

  factory CalorieBurned.fromJson(Map<String, dynamic> json) =>
      _$CalorieBurnedFromJson(json);

  Map<String, dynamic> toJson() => _$CalorieBurnedToJson(this);
}

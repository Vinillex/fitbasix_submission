import 'package:json_annotation/json_annotation.dart';

part 'water_consumed.g.dart';

@JsonSerializable()
class WaterConsumed {
  final double quantity;
  final DateTime dateTime;

  WaterConsumed({
    required this.quantity,
    required this.dateTime,
  });

  factory WaterConsumed.fromJson(Map<String, dynamic> json) =>
      _$WaterConsumedFromJson(json);

  Map<String, dynamic> toJson() => _$WaterConsumedToJson(this);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'water_consumed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WaterConsumed _$WaterConsumedFromJson(Map<String, dynamic> json) =>
    WaterConsumed(
      quantity: (json['quantity'] as num).toDouble(),
      dateTime: DateTime.parse(json['dateTime'] as String),
    );

Map<String, dynamic> _$WaterConsumedToJson(WaterConsumed instance) =>
    <String, dynamic>{
      'quantity': instance.quantity,
      'dateTime': instance.dateTime.toIso8601String(),
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calorie_burned.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CalorieBurned _$CalorieBurnedFromJson(Map<String, dynamic> json) =>
    CalorieBurned(
      quantity: (json['quantity'] as num).toDouble(),
      dateTime: DateTime.parse(json['dateTime'] as String),
    );

Map<String, dynamic> _$CalorieBurnedToJson(CalorieBurned instance) =>
    <String, dynamic>{
      'quantity': instance.quantity,
      'dateTime': instance.dateTime.toIso8601String(),
    };

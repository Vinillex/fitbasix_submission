import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:fitbasix_submission/model/water_consumed/water_consumed.dart';

import '../../utility/get_its.dart';
import '../model/api_failure.dart';

class WaterConsumedService {
  WaterConsumedService();

  Future<Either<List<WaterConsumed>, ApiFailure>> getWaterConsumedData() async {
    try {
      DateTime dateTime = DateTime.now().subtract(Duration(days: 14,));
      DateTime date = DateTime(dateTime.year, dateTime.month, dateTime.day);
      List<WaterConsumed> waterConsumedList = [];
      final data = await fStore
          .collection('waterConsumed')
          .where('dateTime',isGreaterThanOrEqualTo: date.toIso8601String())
          .get();
      final snapshot = data.docs;
      waterConsumedList = snapshot
          .map((documentSnapshot) => WaterConsumed.fromJson(documentSnapshot.data()))
          .toList();
      print(waterConsumedList.map((e) => e.dateTime).toList());
      print('From Database');
      final dateTimeList = List.generate(14, (index) {
        DateTime dateTime = DateTime.now().subtract(Duration(days: index,));
        return DateTime(dateTime.year, dateTime.month, dateTime.day);
      });
      for (var date in dateTimeList) {
        if(!waterConsumedList.any((element) => element.dateTime == date)){
          waterConsumedList.add(WaterConsumed(quantity: 0, dateTime: date));
        }
      }
      waterConsumedList.sort((a,b) => a.dateTime.compareTo(b.dateTime));
      print(waterConsumedList.map((e) => e.dateTime).toList());
      print('uuuuuuuuu');
      return left(waterConsumedList);
    } on FirebaseException catch (e) {
      final error = e.code;
      return right(ApiFailure(error));
    }
  }

  Future<Either<WaterConsumed, ApiFailure>> setWaterConsumedData(WaterConsumed waterConsumed) async {
    try {
      DateTime dateTime = DateTime.now();
      DateTime date = DateTime(dateTime.year, dateTime.month, dateTime.day);
      final data = waterConsumed.toJson();
      await fStore.collection('waterConsumed').doc(date.millisecondsSinceEpoch.toString()).set(data);
      return left(waterConsumed);
    } on FirebaseException catch (e) {
      final error = e.code;
      return right(ApiFailure(error));
    }
  }
}

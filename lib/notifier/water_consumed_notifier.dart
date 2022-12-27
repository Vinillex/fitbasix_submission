import 'package:fitbasix_submission/model/water_consumed/water_consumed.dart';
import 'package:fitbasix_submission/service/water_consumed_service.dart';
import 'package:fitbasix_submission/utility/get_its.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final waterConsumedListNotifier =
StateNotifierProvider<WaterConsumedListNotifier, AsyncValue<List<WaterConsumed>>>(
      (ref) {
    return WaterConsumedListNotifier(waterConsumedService);
  },
);

class WaterConsumedListNotifier extends StateNotifier<AsyncValue<List<WaterConsumed>>> {
  final WaterConsumedService waterConsumedService;

  WaterConsumedListNotifier(this.waterConsumedService) : super(AsyncLoading());

  Future requestWaterConsumedListData() async {
    final status = await waterConsumedService.getWaterConsumedData();
    status.fold(
          (success) {
        state = AsyncData(success);
      },
          (error) {
        state = AsyncError(error);
      },
    );
  }

  Future setWaterConsumedData(WaterConsumed waterConsumed) async {
    final status = await waterConsumedService.setWaterConsumedData(waterConsumed);
    status.fold(
          (success) {
            state.value?.last = success;
        state = AsyncData(state.value!);
      },
          (error) {
        state = AsyncError(error);
      },
    );
  }
}

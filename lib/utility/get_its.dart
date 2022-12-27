import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitbasix_submission/model/water_consumed/water_consumed.dart';
import 'package:fitbasix_submission/service/water_consumed_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';


final GetIt getIt = GetIt.instance;

void registerDependencies() {

  // Firebase instances //
  getIt.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);
  // Firebase instances End //

  // Services //
   getIt.registerSingleton<WaterConsumedService>(WaterConsumedService());
  // getIt.registerSingleton<UserService>(UserService());
  // getIt.registerSingleton<UploadFileService>(UploadFileService());
  // getIt.registerSingleton<RestaurantService>(RestaurantService());
  // getIt.registerSingleton<SectionService>(SectionService());
  // getIt.registerSingleton<ProductService>(ProductService());
  // getIt.registerSingleton<CartService>(CartService());
  // getIt.registerSingleton<ActiveMenuService>(ActiveMenuService());
  // getIt.registerSingleton<OrderService>(OrderService());
  // getIt.registerSingleton<AdvertisementService>(AdvertisementService());
  // getIt.registerSingleton<AdminService>(AdminService());
  // getIt.registerSingleton<RemoteConfigService>(RemoteConfigService());
  // getIt.registerSingleton<FeedbackService>(FeedbackService());
  //Services End//

  getIt.registerSingleton<GlobalKey>(GlobalKey<ScaffoldMessengerState>());
}

final fStore = getIt.get<FirebaseFirestore>();

final waterConsumedService = getIt.get<WaterConsumedService>();
// final userService = getIt.get<UserService>();
// final uploadFileService = getIt.get<UploadFileService>();
// final restaurantService = getIt.get<RestaurantService>();
// final productService = getIt.get<ProductService>();
// final sectionService = getIt.get<SectionService>();
// final cartService = getIt.get<CartService>();
// final activeMenuService = getIt.get<ActiveMenuService>();
// final orderService = getIt.get<OrderService>();
// final advertisementService = getIt.get<AdvertisementService>();
// final adminService = getIt.get<AdminService>();
// final feedbackService = getIt.get<FeedbackService>();
// final remoteConfigService = getIt.get<RemoteConfigService>();

final globalKey = getIt.get<GlobalKey>();


import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_it/get_it.dart';

import '../data/flutter_local_push_notification_repository.dart';
import '../domain/android_push_config.dart';
import '../domain/local_push_config.dart';
import '../domain/local_push_repository.dart';

class LocalPushNotificationsModule {
  static void init(GetIt sl) {
    sl
      ..registerSingleton<LocalPushConfig>(AndroidPushConfig())
      ..registerSingleton<FlutterLocalNotificationsPlugin>(
        FlutterLocalNotificationsPlugin(),
      )
      ..registerLazySingleton<LocalPushRepository>(
        () => FlutterLocalPushNotificationRepository(sl(), sl()),
      );
  }
}

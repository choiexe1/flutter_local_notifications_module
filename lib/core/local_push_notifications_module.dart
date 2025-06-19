import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_it/get_it.dart';

import 'package:local_push_notifications_module/data/repositories/flutter_local_push_notification_repository.dart';
import 'package:local_push_notifications_module/domain/configs/android_push_config.dart';
import 'package:local_push_notifications_module/domain/configs/local_push_config.dart';
import 'package:local_push_notifications_module/domain/repositories/local_push_repository.dart';
import 'package:local_push_notifications_module/domain/use_cases/immediate_push_use_case.dart';
import 'package:local_push_notifications_module/domain/use_cases/scheduled_push_use_case.dart';

class LocalPushNotificationsModule {
  static void init(GetIt sl) {
    sl
      // Configs
      ..registerSingleton<LocalPushConfig>(AndroidPushConfig())
      ..registerSingleton<FlutterLocalNotificationsPlugin>(
        FlutterLocalNotificationsPlugin(),
      )
      // Repositories
      ..registerLazySingleton<LocalPushRepository>(
        () => FlutterLocalPushNotificationRepository(sl(), sl()),
      )
      // Use Cases
      ..registerLazySingleton<ImmediatePushUseCase>(
        () => ImmediatePushUseCase(sl()),
      )
      ..registerLazySingleton<ScheduledPushUseCase>(
        () => ScheduledPushUseCase(sl()),
      );
  }
}

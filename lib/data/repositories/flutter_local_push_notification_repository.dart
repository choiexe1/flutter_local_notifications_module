import 'dart:async';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:local_push_notifications_module/domain/configs/local_push_config.dart';
import 'package:local_push_notifications_module/domain/repositories/local_push_repository.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class FlutterLocalPushNotificationRepository implements LocalPushRepository {
  FlutterLocalPushNotificationRepository(this._plugin, this._config) {
    _initialize();
  }

  final FlutterLocalNotificationsPlugin _plugin;
  final LocalPushConfig _config;

  Future<void> _initialize() async {
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation(_config.timeZone));

    final androidSettings = AndroidInitializationSettings(_config.icon);

    final initializeSetting = InitializationSettings(android: androidSettings);

    await _plugin.initialize(initializeSetting);
  }

  NotificationDetails _notificationDetails() {
    return NotificationDetails(
      android: AndroidNotificationDetails(
        _config.channelId,
        _config.channelName,
        importance: Importance.max,
        priority: Priority.high,
      ),
    );
  }

  @override
  Future<void> cancelNotificationById(int id) {
    throw UnimplementedError();
  }

  @override
  Future<void> cancelNotifications() {
    throw UnimplementedError();
  }

  @override
  Future<void> durationPush({
    required String title,
    required String body,
    required Duration duration,
    required int id,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<void> immediatePush({
    required String title,
    required String body,
    required int id,
  }) async {
    await _plugin.show(id, title, body, _notificationDetails());
  }

  @override
  Future<void> scheduledPush({
    required String title,
    required String body,
    required int id,
  }) {
    throw UnimplementedError();
  }
}

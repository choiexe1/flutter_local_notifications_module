abstract interface class LocalPushRepository {
  Future<void> immediatePush({
    required String title,
    required String body,
    required int id,
  });

  Future<void> durationPush({
    required String title,
    required String body,
    required Duration duration,
    required int id,
  });

  Future<void> scheduledPush({
    required String title,
    required String body,
    required int id,
  });

  Future<void> cancelNotificationById(int id);
  Future<void> cancelNotifications();
}

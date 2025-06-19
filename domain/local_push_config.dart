abstract class LocalPushConfig {
  const LocalPushConfig({
    required this.icon,
    required this.timeZone,
    required this.channelId,
    required this.channelName,
  });

  final String icon;
  final String timeZone;
  final String channelId;
  final String channelName;
}

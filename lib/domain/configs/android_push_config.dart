import 'package:local_push_notifications_module/domain/configs/local_push_config.dart';

class AndroidPushConfig implements LocalPushConfig {
  AndroidPushConfig({
    this.icon = '@mipmap/ic_launcher',
    this.timeZone = 'Asia/Seoul',
    this.channelId = 'Planee',
    this.channelName = '플래니 알림',
  });

  @override
  final String icon;

  @override
  final String timeZone;

  @override
  final String channelId;

  @override
  final String channelName;
}

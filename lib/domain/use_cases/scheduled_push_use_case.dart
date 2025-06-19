import 'package:local_push_notifications_module/domain/repositories/local_push_repository.dart';

class ScheduledPushUseCase {
  const ScheduledPushUseCase(this._localPushRepository);

  final LocalPushRepository _localPushRepository;

  Future<void> execute({
    required int id,
    required String title,
    required String body,
    required DateTime dateTime,
  }) async {
    await _localPushRepository.scheduledPush(
      id: id,
      body: body,
      title: title,
      dateTime: dateTime,
    );
  }
}

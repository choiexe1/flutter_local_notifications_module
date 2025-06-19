import 'package:local_push_notifications_module/domain/repositories/local_push_repository.dart';

class ImmediatePushUseCase {
  const ImmediatePushUseCase(this._localPushRepository);

  final LocalPushRepository _localPushRepository;

  Future<void> execute({
    required int id,
    required String title,
    required String body,
  }) async {
    await _localPushRepository.immediatePush(id: id, body: body, title: title);
  }
}

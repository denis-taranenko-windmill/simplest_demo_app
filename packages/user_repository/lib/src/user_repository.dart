import 'package:uuid/uuid.dart';

import 'models/models.dart';

class UserRepository {
  User? _user;

  Future<User?> getUser() async {
    if (_user != null) {
      return _user;
    }
    return Future.delayed(
        const Duration(milliseconds: 700), () => User(id: const Uuid().v4(), name: 'Test name'));
  }

  void clean() {
    _user = null;
  }
}

import 'package:assignment_test/features/data/repositories/repo_impl.dart';
import 'package:flutter/material.dart';

import '../models/login_model.dart';

class BaseRepository {
  late RepoImpl _repoImpl;
  BaseRepository() {
    _repoImpl = RepoImpl();
  }

  Future<bool> login(BuildContext context, LoginModel loginModel) =>
      _repoImpl.login(context, loginModel);
}

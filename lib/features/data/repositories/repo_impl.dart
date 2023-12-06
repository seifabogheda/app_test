import 'package:assignment_test/features/data/models/login_model.dart';
import 'package:assignment_test/features/data/repositories/base_repo.dart';
import 'package:flutter/material.dart';

import '../../../core/api_service/dio_helper.dart';
import '../../../core/helpers/snack_helper.dart';
import '../../../core/resources/api_names.dart';

class RepoImpl  {
  Future<bool> login(BuildContext context, LoginModel loginModel) async {
    var data = await DioHelper()
        .post(url: ApiNames.login, body: loginModel.toJson(), context: context);
    if (data != null) {
      if (context.mounted) {
        SnackBarHelper.showBasicSnack(
            context: context, msg: 'تم التسجيل بنجاح');
      }
      return true;
    } else {
      return false;
    }
  }
}

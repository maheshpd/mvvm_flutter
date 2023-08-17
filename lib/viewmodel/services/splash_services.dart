import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_flutter/model/usermodel.dart';
import 'package:mvvm_flutter/utils/routes/routes_name.dart';
import 'package:mvvm_flutter/viewmodel/user_view_model.dart';

class SplashServices {
  Future<UserModel> getUserData() => UserViewModel().getUser();

  void checkAuthentican(BuildContext context) async {
    getUserData().then((value) async {
      if (value.token.toString() == "null" || value.token.toString() == '') {
        await Future.delayed(const Duration(seconds: 3));
        if (context.mounted) {
          Navigator.pushNamed(context, RoutesName.login);
        }
      } else {
        await Future.delayed(const Duration(seconds: 3));
        if (context.mounted) {
          Navigator.pushNamed(context, RoutesName.home);
        }
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}

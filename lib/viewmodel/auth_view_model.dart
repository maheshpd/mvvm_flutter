import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_flutter/model/usermodel.dart';
import 'package:mvvm_flutter/repository/auth_repository.dart';
import 'package:mvvm_flutter/utils/routes/routes_name.dart';
import 'package:mvvm_flutter/utils/utils.dart';
import 'package:mvvm_flutter/viewmodel/user_view_model.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.loginApi(data).then((value) {
      setLoading(false);

      //save user token in sharedpreference
      final userPreference = Provider.of<UserViewModel>(context, listen: false);
      userPreference.saveUser(UserModel(
        token: value['token'].toString()
      ));

      Utils.flushBarErrorMessage("Login Successfull", context);
      Navigator.pushNamed(context, RoutesName.home);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        Utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }

  Future<void> signup(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.registerApi(data).then((value) {
      setLoading(false);
      Utils.flushBarErrorMessage("SignUp Successfull", context);
      Navigator.pushNamed(context, RoutesName.home);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        Utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }
}

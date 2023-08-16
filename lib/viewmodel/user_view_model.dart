import 'package:flutter/material.dart';
import 'package:mvvm_flutter/model/usermodel.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier {
  late SharedPreferences sp;
  Future<bool> saveUser(UserModel user) async {
    sp = await SharedPreferences.getInstance();
    sp.setString('token', user.token.toString());
    notifyListeners();
    return true;
  }

  Future<UserModel> getUser() async {
    sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('token');
    return UserModel(token: token.toString());
  }

  Future<bool> remove() async {
    sp = await SharedPreferences.getInstance();
    sp.remove('token');
    return true;
  }
}

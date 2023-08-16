import 'package:mvvm_flutter/data/network/base_api_services.dart';
import 'package:mvvm_flutter/data/network/network_api_services.dart';
import 'package:mvvm_flutter/res/app_url.dart';

class AuthRepository {
  BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.postApiResponse(AppUrl.loginEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.postApiResponse(AppUrl.signupEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}

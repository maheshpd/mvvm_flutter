import 'package:mvvm_flutter/data/network/base_api_services.dart';
import 'package:mvvm_flutter/data/network/network_api_services.dart';
import 'package:mvvm_flutter/model/movies_model.dart';
import 'package:mvvm_flutter/res/app_url.dart';

class HomeRepository {
  BaseApiServices _apiServices = NetworkApiServices();

  Future<MovieListModel> getMovieApi() async {
    try {
      dynamic response =
          await _apiServices.getApiResponse(AppUrl.moviesListEndpoint);
      return response = MovieListModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}

import 'package:getx_mvvm/data/network/network_api_services.dart';
import 'package:getx_mvvm/model/home_model/home_model.dart';

import 'package:getx_mvvm/res/url/app_url.dart';

class HomeRepository {
  final apiService = NetworkApiServices();

  Future<HomeModel> fetchApi() async {
    dynamic response = await apiService.getApi(AppUrl.fetchUrl);
    return HomeModel.fromJson(response);
  }
}

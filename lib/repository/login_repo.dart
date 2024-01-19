import 'package:getx_mvvm/data/network/network_api_services.dart';
import 'package:getx_mvvm/model/user_model/user_model.dart';
import 'package:getx_mvvm/res/url/app_url.dart';

class LoginRepository {
  final apiService = NetworkApiServices();

  Future<dynamic> loginApi(var data) async {                // why Future<dynamic> ?
    dynamic response = await apiService.postApi(data, AppUrl.loginUrl);
    return response;
  }
}

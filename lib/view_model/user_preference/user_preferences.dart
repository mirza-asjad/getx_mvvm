
import 'package:getx_mvvm/model/user_model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  Future<bool> saveUser(UserModel userModel) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('token', userModel.token.toString());
    return true;
  }

  Future<UserModel> getUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString('token');
    return UserModel(
      token: token,
    );
  }

  Future<bool> removeUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
    return true;
  }
}

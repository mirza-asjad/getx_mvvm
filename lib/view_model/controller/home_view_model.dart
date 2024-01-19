import 'package:get/get.dart';
import 'package:getx_mvvm/data/response/status.dart';
import 'package:getx_mvvm/model/home_model/home_model.dart';

import 'package:getx_mvvm/repository/home_repo.dart';

class HomeViewModel extends GetxController {
  final api = HomeRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final homeList = HomeModel().obs;
  RxString error = ''.obs;

  void setrxRequestStatus(Status value) {
    rxRequestStatus.value = value;
  }

  void sethomeList(HomeModel value) {
    homeList.value = value;
  }

  void setError(String value) {
    error.value = value;
  }

  void fetchHomeApi() {
    api.fetchApi().then((value) {
      setrxRequestStatus(Status.COMPLETED);
      sethomeList(value);
    }).onError((error, stackTrace) {
      setError(error.toString());
      print(error);
      print(stackTrace); // for error background ***important concept
      setrxRequestStatus(Status.ERROR);
    });
  }
}

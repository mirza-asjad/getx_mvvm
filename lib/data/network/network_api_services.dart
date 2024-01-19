import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:getx_mvvm/data/exceptions/api_exceptions.dart';
import 'package:getx_mvvm/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  dynamic responseJson;
  @override
  Future getApi(String url) async {
    if (kDebugMode) {
      print(url);
    }

    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetExceptions();
    } on TimeoutException {
      throw TimeOutExceptions();
    }

    return responseJson;
  }

  @override
  Future postApi(var data, String url) async {
    if (kDebugMode) {
      print(url);
      print(data);
    }

    try {
      final response = await http
          .post(Uri.parse(url),
              body:
                  data) // if the data is in RAW, we need to encode it, if not we don't need to encode it just like here
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetExceptions();
    } on TimeoutException {
      throw TimeOutExceptions();
    }

    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw RequestExceptions('Bad Request');

      default:
        throw FetchDataExceptions(
            'Exception : ${response.statusCode.toString()}');
    }
  }
}

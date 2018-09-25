import 'dart:async';

import 'package:flutter_test_auth_2_app/utils/network_util.dart';
import 'package:flutter_test_auth_2_app/models/user.dart';

class RestDatasource {
  NetworkUtil _netUtil = new NetworkUtil();
  static final BASE_URL = "https://saptestcopincompanya.authentication.eu10.hana.ondemand.com";
  static final LOGIN_URL = BASE_URL + "/login";
  static final _API_KEY = "somerandomkey";

  Future<User> login(String username, String password) {
    return _netUtil.post(LOGIN_URL, body: {
      "token": _API_KEY,
      "username": username,
      "password": password
    }).then((dynamic res){
      if(res["error"]) throw new Exception(res["error_msg"]);
      return new User.map(res["user"]);
    });
  }
}
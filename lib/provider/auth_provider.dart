import 'dart:convert';
import 'dart:developer';

import 'package:house/model/account_model.dart';
import 'package:house/model/api_response.dart';
import 'package:house/model/user_model.dart';
import 'package:house/provider/service.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthApiProvider {
  Future<ApiResponse> login(String email, String password) async {
    ApiResponse apiResponse = ApiResponse();
    final response = await http.post(Uri.parse(loginURL),
        headers: {'Accept': 'application/json'},
        body: {'email': email, 'password': password});
log(response.toString());
    log(response.toString());
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body)['data'];
      apiResponse.data = UserModel.fromJson(parsed);
      return apiResponse;
    } else {
      apiResponse.error = json.decode(response.body)['errors'];
      return apiResponse;
      // throw Exception('Failed to load album');
    }
  }

  Future<ApiResponse> register(
      String pseudo, String email, String password) async {
    ApiResponse apiResponse = ApiResponse();
    final response = await http.post(Uri.parse(registerURL),
        headers: {'Accept': 'application/json'},
        body: {'name': pseudo, 'email': email, 'password': password});
    log(email);
    log(response.body.toString());
log(response.toString());
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body)['data'];
      apiResponse.data = UserModel.fromJson(parsed);
      return apiResponse;
    } else {
      apiResponse.error = json.decode(response.body)['errors'];
      return apiResponse;
      // throw Exception('Failed to load album');
    }
  }

  Future<String?> getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString('token');
  }

// get user id
  Future<int> getUserId() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getInt('userId') ?? 0;
  }

  Future<ApiResponse1> getAccount() async {
    ApiResponse1 apiResponse = ApiResponse1();
    String? token = await AuthApiProvider().getToken();
    log(token!);

    final response = await http.get(Uri.parse(accountsURL), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    // log(response.body.toString());
    if (response.statusCode == 200) {
      log('messageqs');
      final parsed = json.decode(response.body)['data'];
      log(parsed.toString());
      apiResponse.data = parsed.map((e) => AccountModel.fromJson(e)).toList();
      return apiResponse;
    } else {
      log('message');
      apiResponse.error = json.decode(response.body)['errors'];
      return apiResponse;
      // throw Exception('Failed to load album');
    }
  }

// logout
  Future<bool> logout() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return await pref.remove('token');
  }
}

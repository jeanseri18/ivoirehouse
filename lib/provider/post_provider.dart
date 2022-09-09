import 'dart:convert';
import 'dart:developer';

import 'package:house/model/api_response.dart';
import 'package:house/model/post_model.dart';
import 'package:house/provider/auth_provider.dart';
import 'package:house/provider/service.dart';
import 'package:http/http.dart' as http;

class PostApiProvider {
  Future<ApiResponse1> getPosts() async {
    ApiResponse1 apiResponse = ApiResponse1();
    String? token = await AuthApiProvider().getToken();
    // log(token!);

    final response = await http.get(Uri.parse(postsURL), headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });

    // log(response.body.toString());
    if (response.statusCode == 200) {

            // var responseWrapper = Api2ResponseWrapperModel.fromJson(response);
  //  log('messageqs');
      final parsed = json.decode(response.body)['data'];
  //  log(parsed.toString());

  //  final result =  <PostModel>[];
  // json['result'].forEach((v) {
  //   result.add(new Result.fromJson(v));
  // });
      apiResponse.data = 
      parsed.map((e)=>PostModel.fromJson(e)).toList() ;
      // List<PostModel>.from(
      //   parsed.map((p) { log(p.toString());
      //     return PostModel.fromJson(p);}),
      // );
        //  log('ggg'+apiResponse.data.toString());
      return apiResponse;
    } else {
      log('message');
      apiResponse.error = json.decode(response.body)['errors'];
      return apiResponse;
      // throw Exception('Failed to load album');
    }
  }
}

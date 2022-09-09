import 'package:house/core/parsing_tools.dart';

class ApiResponse {
  Object? data;
  String? error;
  String ? message;
}

class ApiResponse1 {
  Object? data;
  String? error;
  String ? message;
}

class Api2ResponseWrapperModel {
  //constructor
  Api2ResponseWrapperModel({
    required this.status,
    this.message = '',
    this.errorCode = '',
    this.data,
  });

  //factory
  factory Api2ResponseWrapperModel.fromJson(Map<String, dynamic> json) {
    return Api2ResponseWrapperModel(
        status: json[jsonStatus] ?? '',
        message: json[jsonMessage] ?? '',
        errorCode: ParsingTools.parseString(json[jsonErrorCode]),
        data: json[jsonData]);
  }

  static const jsonStatus = 'status';
  static const jsonMessage = 'message';
  static const jsonErrorCode = 'errorCode';
  static const jsonData = 'data';

  final String status;
  final String message;
  final String errorCode;
  final Map<String, dynamic>? data;

  bool get isOk => status == 'true';
}
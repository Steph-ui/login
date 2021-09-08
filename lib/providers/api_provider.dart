import 'dart:convert';
import '../responses/responses.dart';
import '../providers/provider.dart';
import '../utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class ApiProvider {

  Future<FarmerListResponse> getFarmerList() async{
    int? statusCode;
    try {
      var response = await doGetRequestt(
          '$ENDPOINT_GET_FARMER_LIST');
      statusCode = response.statusCode;

      print("survey data: ${response.body}");
      if (_isConnectionSuccessful(statusCode)) {
        print("is success");
        var decodedBody = jsonDecode(response.body);
        var requestResponse = FarmerListResponse.fromJson(decodedBody);
        requestResponse.statusCode = statusCode;

        return requestResponse;
      } else {
        var requestResponse = FarmerListResponse();
        requestResponse.responseCode = "-100";
        requestResponse.statusCode = statusCode;

        return requestResponse;
      }
    }catch(e){
      print("error: ${e.toString()}");
      var requestResponse = FarmerListResponse();
      requestResponse.statusCode = statusCode;
      requestResponse.message = e.toString();

      return requestResponse;
    }
  }
}

_handleDioError(DioError error) {
  String errorDescription = "";
  switch (error.type) {
    case DioErrorType.cancel:
      errorDescription = "Request to server was cancelled";
      break;
    case DioErrorType.connectTimeout:
      errorDescription = "Connection timeout with server";
      break;
    case DioErrorType.other:
      errorDescription = "Connection to server failed due to internet connection";
      break;
    case DioErrorType.receiveTimeout:
      errorDescription = "Receive timeout in connection with server";
      break;
    case DioErrorType.sendTimeout:
      errorDescription = "Send Timeout in connection with Server";
      break;
    case DioErrorType.response:
      errorDescription =
      "Something went wrong and your request could not be completed";
      break;
  }
  return errorDescription;
}

/// Get header for normal GET-POST requests.
Future<Map<String, String>> _getNormalHeader() async {
  var header = Map<String, String>();
  header[KEY_CONTENT_TYPE] = "application/json";

  String token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo2Nzk3LCJ1c2VybmFtZSI6InNvbW90b3llIiwiZXhwIjoxNjQ3NzgxODY3LCJlbWFpbCI6Im1hcnlhbS5tLnl1c3VmMTgwMkBnbWFpbC5jb20ifQ.-Wki9TDAyXhRIRX5m1nzAvcFjQlkLqWB4r0kDd6n9yU";
  if (token.isNotEmpty) {
    header[KEY_AUTHORIZATION] = "WB3 $token";
}

  return header;
}


Future<Response> doPostRequest(String endPoint, dynamic body) async {
  var header = await _getNormalHeader();
  //print('header: ${header}');

  var dio = Dio();
  dio.options.baseUrl = BASE_API_URL;
  dio.options.connectTimeout = 30000; //30s
  dio.options.receiveTimeout = 60000;

  //print('header: ${jsonEncode(body)}');
  return dio.post("$endPoint", data: jsonEncode(body), options: Options(headers: header));
}

Future<Response> doGetRequest(String endPoint) async {
  var header = await _getNormalHeader();
  //print('header: ${header}');

  var dio = Dio();
  dio.options.baseUrl = BASE_API_URL;
  dio.options.connectTimeout = 120000; //120s
  dio.options.receiveTimeout = 60000;

  print('endpoint: $BASE_API_URL$endPoint');
  return dio.get("$endPoint", options: Options(headers: header));
}

Future<http.Response> doGetRequestt(String endPoint) async {
  var header = await _getNormalHeader();
  //print("get header: $header");
  return http.get(Uri.parse("$BASE_API_URL$endPoint"), headers: header, );//..timeout(const Duration(seconds: 60));
}

bool _isConnectionSuccessful(int? statusCode) => statusCode == 200 || statusCode == 201;


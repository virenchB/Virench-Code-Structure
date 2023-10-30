import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:app_structure/app_export.dart';

class NetworkApiService extends BaseApiService {
  @override
  Future getResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(url));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("");
    } on RequestTimeoutException {
      throw RequestTimeoutException("");
    }
    return responseJson;
  }

  @override
  Future postResponse(String url, Map<String, dynamic> jsonBody) async {
    dynamic responseJson;
    try {
      final response = await http.post(
        Uri.parse(url),
        body: jsonEncode(jsonBody),
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
        },
      ).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw TimeoutException("Please Try Again..");
        },
      );
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("");
    } on RequestTimeoutException {
      throw RequestTimeoutException("");
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) async {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException("Please Check Again..");
      case 401:
      case 403:
        throw UnauthorisedRequestException("Please Try Again..");
      case 404:
        throw UnauthorisedRequestException("Please Try Again..");
      case 500:
        throw ServerException("Error occurred while communication with server");
      default:
        throw DefaultException(
            '\nError occurred while communication with server');
    }
  }
}

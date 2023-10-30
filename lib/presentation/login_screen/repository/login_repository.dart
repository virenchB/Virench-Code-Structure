import 'dart:convert';

import 'package:app_structure/app_export.dart';
import 'package:app_structure/presentation/login_screen/models/login_model.dart';

class LoginRepository {
  final BaseApiService _apiService = NetworkApiService();

  Future<LoginModel> getLoginResponse(Map<String, dynamic> jsonBody) async {
    try {
      dynamic response = await _apiService.postResponse(
        "${ApiEndPoints().baseApi}${ApiEndPoints().login}",
        jsonBody,
      );
      final jsonData = jsonDecode(response);
      return jsonData;
    } catch (e) {
      rethrow;
    }
  }
}

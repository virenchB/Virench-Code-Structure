import 'package:app_structure/app_export.dart';
import 'package:app_structure/presentation/login_screen/models/login_model.dart';
import 'package:app_structure/presentation/login_screen/repository/login_repository.dart';

class LoginController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  Rx<String> status = "loading".obs;
  final LoginRepository _loginRepository = LoginRepository();
  ApiResponse<LoginModel> loginResultModel = ApiResponse.loading();

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  // Login API Calling and get data
  void _setLoginResponse(ApiResponse<LoginModel> response) {
    if (kDebugMode) {
      print("Login Result :-\n $response");
    }
    loginResultModel = response;
    if (loginResultModel.status == Status.completed) {
      status.value = "complete";
    } else if (loginResultModel.status == Status.error) {
      status.value = "error";
    } else {
      status.value = "loading";
    }
  }

  Future<void> fetchLoginResponse() async {
    Map<String, dynamic> jsonBody = {"request": {}};
    _setLoginResponse(ApiResponse.loading());
    _loginRepository
        .getLoginResponse(jsonBody)
        .then((value) => _setLoginResponse(ApiResponse.completed(value)))
        .onError((error, stackTrace) =>
        _setLoginResponse(ApiResponse.error(error.toString())));
  }
}

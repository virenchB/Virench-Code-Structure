import 'package:app_structure/app_export.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    Future.delayed(const Duration(milliseconds: 2000), () {
      Get.offNamed(
        AppRoutesName.loginScreen,
      );
    });
  }
}

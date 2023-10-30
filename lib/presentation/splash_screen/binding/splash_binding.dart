import 'package:app_structure/app_export.dart';
import 'package:app_structure/presentation/splash_screen/controller/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}

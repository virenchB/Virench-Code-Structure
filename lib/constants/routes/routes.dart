import 'package:app_structure/app_export.dart';

class AppRoutes {
  static appRoutes() => [
    GetPage(
      name: AppRoutesName.splashScreen,
      page: () => const SplashScreen(),
      bindings: [
        SplashBinding(),
      ],
    ),
    GetPage(
      name: AppRoutesName.loginScreen,
      page: () => LoginScreen(),
      bindings: [
        LoginBinding(),
      ],
    ),
  ];
}

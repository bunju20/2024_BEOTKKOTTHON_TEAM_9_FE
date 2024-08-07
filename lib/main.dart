import 'package:bommeong/providers/AuthController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:bommeong/main_app.dart';
import 'package:bommeong/utilities/app_routes.dart';
import 'package:bommeong/services/userpreferences_service.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

import 'services/user_service.dart';

void main() async {
  /* Open .env file */
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "assets/config/.env");
  await initializeDateFormatting();
  //await UserPreferences.clearUserData();

  // Splash Screen Duration 1.0s
  await Future.delayed(const Duration(seconds: 1));
  Get.lazyPut(() => AuthService());
  Get.lazyPut(() => AuthController());
  await UserPreferences.init();
  bool isLoggedIn = UserPreferences.getEmail().isNotEmpty;
  print('isLoggedIn: $isLoggedIn');
  KakaoSdk.init(nativeAppKey: '65e4736c1c1b3b1415a369d14adfadc2');

  runApp(MainApp(initialRoute: isLoggedIn ? Routes.ROOT : Routes.LOGIN));
}

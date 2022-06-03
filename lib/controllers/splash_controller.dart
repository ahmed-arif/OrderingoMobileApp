// import 'package:arrant_construction_vendor/src/models/user.dart';

import '../models/user.dart';
import '../repositories/user_repo.dart' as user_repo;

import 'package:get/get.dart';

import '../pages/login.dart';

class SplashController extends GetxController {
  String errorString = "Splash Controller Error :";
  Future<void> goToNextScreen() async {
    user_repo
        .getCurrentUser()
        .then((User _u) {
          if (_u.authToken != null && _u.authToken!.isNotEmpty) {
            Get.offAllNamed('/home');
          } else {
            Get.to(
              const LoginPage(),
              transition: Transition.rightToLeft,
            );
          }
        })
        .onError((error, stackTrace) {})
        .whenComplete(() {});
  }
}

//import 'dart:io';
//import 'package:arrant_construction_vendor/src/models/user.dart';

import 'package:com_unrealprogrammer_orderingo/models/user.dart';
import 'package:com_unrealprogrammer_orderingo/pages/login.dart';

import '../repositories/user_repo.dart' as user_repo;
import 'package:com_unrealprogrammer_orderingo/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../helpers/helper.dart';

class UserController extends GetxController {
  User user = User();

  final String errorString = "User Controller Error :";

  Future<void> login(BuildContext context) async {
    OverlayEntry loader = Helper.overlayLoader(context);
    Overlay.of(context)?.insert(loader);

    user_repo.login(user).then((User _user) {
      if (_user.email != null && _user.email!.isNotEmpty) {
        Get.to(const HomePage());
        Fluttertoast.showToast(msg: "Login Successfull !");
      } else {
        Fluttertoast.showToast(msg: "Failed! No record found");
      }
    }).onError((error, stackTrace) {
      print("$errorString $error");
      Fluttertoast.showToast(msg: "Failed! Check internet connection");
    }).whenComplete(() {
      Helper.hideLoader(loader);
    });
  }

//   Future updateUser(BuildContext context, User currentUser,
//       {File? imageFile}) async {
//     OverlayEntry loader = Helper.overlayLoader(context);
//     Overlay.of(context)?.insert(loader);
//     await user_repo
//         .updateUser(currentUser, imageFile: imageFile)
//         .then((User _updatedUser) {
//       if (_updatedUser.id!.isNotEmpty) {
//         user_repo.currentUser.value = _updatedUser;
//         Fluttertoast.showToast(msg: "Updated");
//       }
//     }).onError((error, stackTrace) {
//       Fluttertoast.showToast(msg: "Failed");
//     }).whenComplete(() {
//       Helper.hideLoader(loader);
//     });
//   }

  Future<void> logoutUser() async {
    user_repo.removeCurrentUser().then(
      (value) {
        if (value) {
          Get.offAll(
            const LoginPage(),
          );
        }
      },
    ).onError((error, stackTrace) {
      print(" $error");
    }).whenComplete(() {});
  }
}

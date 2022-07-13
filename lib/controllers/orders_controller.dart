import 'dart:ui';

import 'package:com_unrealprogrammer_orderingo/models/orders.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:com_unrealprogrammer_orderingo/repositories/orders_repo.dart'
    as order_repo;

class OrdersController extends GetxController {
  final String errorString = "Orders Controller Error: ";
  var vendorOrders = <Orders>[].obs;

  // progress variables
  var doneFetchingOrders = false.obs;

  Future<void> getAllOrders() async {
    doneFetchingOrders.value = false;

    vendorOrders.clear();

    Stream<Orders> stream = await order_repo.getVendorOrders();
    stream.listen((Orders _orders) {
      if (_orders.id != null) {
        vendorOrders.add(_orders);
        print(vendorOrders[0].orderStatus[0].name);
      }
    }, onError: (e) {
      print(errorString + e.toString());
    }, onDone: () {
      doneFetchingOrders.value = true;
    });
  }

  Future<void> updateStatus(Orders order) async {
    final result = await order_repo.updateStatus(order);
    result
        ? Get.showSnackbar(const GetSnackBar(
            snackPosition: SnackPosition.BOTTOM,
            message: "Status Updated to Process!",
            duration: Duration(seconds: 2),
            backgroundColor: Color.fromARGB(255, 193, 45, 45),
          ))
        : Fluttertoast.showToast(msg: "Error: On Data Update");
  }

  Future<void> refreshOrders() async {
    getAllOrders();
  }
}

import 'package:com_unrealprogrammer_orderingo/models/orders.dart';
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
      }
    }, onError: (e) {
      print(errorString + e.toString());
    }, onDone: () {
      doneFetchingOrders.value = true;
    });
  }

  Future<void> updateStatus(Orders order) async {
    final result = await order_repo.updateStatus(order);
    result ? print("Data Updated") : print("Error on Update Order");
  }

  Future<void> refreshOrders() async {
    getAllOrders();
  }
}

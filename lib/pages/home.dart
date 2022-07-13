import 'dart:async';

import 'package:com_unrealprogrammer_orderingo/controllers/orders_controller.dart';
import 'package:com_unrealprogrammer_orderingo/pages/detail_screen.dart';
import 'package:com_unrealprogrammer_orderingo/pages/profile.dart';
import 'package:com_unrealprogrammer_orderingo/widgets/order_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../repositories/user_repo.dart' as user_repo;

import '../widgets/sideBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final OrdersController _con = Get.put(OrdersController());
  var pending = 0.obs;
  var deliver = 0.obs;

  @override
  void initState() {
    _con.getAllOrders();

    getStatus();
    setState(() {});
    super.initState();
  }

  Future<void> getStatus() async {
    pending.value = 0;
    deliver.value = 0;
    Future.delayed(const Duration(seconds: 2), () {
      for (int i = 0; i <= _con.vendorOrders.length; i++) {
        print(_con.vendorOrders[i].orderStatus[0].name!);
        _con.vendorOrders[i].orderStatus[0].name!.toLowerCase() == "pending"
            ? pending.value = pending.value + 1
            : deliver.value = deliver.value + 1;
      }
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String image = user_repo.currentUser.value.imageUrl!['url'];

    return SafeArea(
      child: Scaffold(
        body: WillPopScope(
          onWillPop: () async => false,
          child: RefreshIndicator(
            onRefresh: () async {
              getStatus();
              return _con.refreshOrders();
            },
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          user_repo.currentUser.value.imageUrl != null
                              ? GestureDetector(
                                  onTap: () {
                                    Get.to(const Profile());
                                  },
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                      "http://192.168.5.53:1337" +
                                          user_repo.currentUser.value
                                              .imageUrl!['url'],
                                    ),
                                    radius: 25,
                                  ),
                                )
                              : IconButton(
                                  icon: Icon(
                                    Icons.person,
                                    size: 40,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  alignment: Alignment.center,
                                  onPressed: () {
                                    Get.to(const Profile());
                                  })
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Hey " + user_repo.currentUser.value.username!,
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            // fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Your's All Order are here...",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Padding(
                    //   padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    //   child: Container(
                    //     alignment: Alignment.topLeft,
                    //     child: Text(
                    //       "Current Projects",
                    //       style: TextStyle(
                    //           color: Theme.of(context).primaryColor,
                    //           fontSize: 16,
                    //           fontWeight: FontWeight.bold),
                    //     ),
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                            height: size.height * 0.06,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.grey[300]),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Pending",
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor),
                                  ),
                                  Obx(() {
                                    return Text(
                                      pending.value.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Theme.of(context).primaryColor),
                                    );
                                  }),
                                ]),
                          )),
                          SizedBox(
                            width: size.width * 0.1,
                          ),
                          Expanded(
                              child: Container(
                            height: size.height * 0.06,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.grey[300]),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Delivered",
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor),
                                  ),
                                  Obx(() {
                                    return Text(
                                      deliver.value.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Theme.of(context).primaryColor),
                                    );
                                  }),
                                ]),
                          )),
                          SizedBox(
                            width: size.width * 0.1,
                          ),
                          Expanded(
                              child: Container(
                            height: size.height * 0.06,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.grey[300]),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Total",
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor),
                                  ),
                                  Obx(() {
                                    return Text(
                                      _con.vendorOrders.length.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Theme.of(context).primaryColor),
                                    );
                                  }),
                                ]),
                          )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Expanded(
                      child: Obx(() {
                        return _con.vendorOrders.isEmpty &&
                                _con.doneFetchingOrders.value
                            ? _noOrdersToShow()
                            : _con.vendorOrders.isEmpty &&
                                    !_con.doneFetchingOrders.value
                                ? const Center(
                                    child: CircularProgressIndicator.adaptive(),
                                  )
                                : ListView.builder(
                                    padding: const EdgeInsets.all(0),
                                    itemCount: _con.vendorOrders.length,
                                    itemBuilder: (ctx, index) {
                                      return Column(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                10, 10, 10, 10),
                                            child: Container(
                                              height: 120,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  color: Theme.of(context)
                                                      .primaryColor),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: OrderList(
                                                  status: _con
                                                      .vendorOrders[index]
                                                      .orderStatus[0]
                                                      .name, //projectList[index]?.projectName ?? "",
                                                  orderNum: "Order# " +
                                                      _con.vendorOrders[index]
                                                          .id
                                                          .toString(),
                                                  orderAt: _con
                                                          .vendorOrders[index]
                                                          .createdAt
                                                          .toString()
                                                          .split(" ")
                                                          .first +
                                                      "\n",
                                                  //+
                                                  // _con.vendorOrders[index]
                                                  //     .createdAt
                                                  //     .toString()
                                                  //     .split(" ")
                                                  //     .last,

                                                  deliverAt: _con
                                                          .vendorOrders[index]
                                                          .deliveryDate
                                                          .toString()
                                                          .split(" ")
                                                          .first +
                                                      "\n",
                                                  type: _con.vendorOrders[index]
                                                          .weeklyNeeded
                                                      ? "Weekly"
                                                      : "Daily",
                                                  onClick: () {
                                                    // Navigator.push(
                                                    //   context,
                                                    //   MaterialPageRoute(
                                                    //     builder: (context) =>
                                                    //         DashBoardScreen(
                                                    //       project:
                                                    //           projectList[
                                                    //               index],
                                                    //     ),
                                                    //   ),
                                                    // );
                                                    Get.to(DetailScreen(
                                                        order:
                                                            _con.vendorOrders[
                                                                index]));
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                          //divider()
                                          const SizedBox(height: 0)
                                        ],
                                      );
                                    },
                                  );
                      }),
                    )
                    // : Center(
                    //     child: Text(
                    //       'You are not yet ant order. Please Contact your administrator.',
                    //       textAlign: TextAlign.center,
                    //     ),
                    //   ),
                  ],
                ),
                SideBar(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _noOrdersToShow() {
    Text noProjectsTextWidget =
        const Text("No Orders to show! Tap to refresh.");
    IconButton refreshButton = IconButton(
      onPressed: () {
        _con.refreshOrders();
      },
      icon: const Icon(Icons.refresh),
    );
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          refreshButton,
          noProjectsTextWidget,
        ],
      ),
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:com_unrealprogrammer_orderingo/controllers/orders_controller.dart';
import 'package:com_unrealprogrammer_orderingo/models/order_status.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import 'package:com_unrealprogrammer_orderingo/models/orders.dart';
import 'package:com_unrealprogrammer_orderingo/widgets/table.dart';
import 'package:get/get.dart';

class DetailScreen extends StatefulWidget {
  Orders order;
  DetailScreen({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final OrdersController _con = Get.put(OrdersController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 50, 0, 0),
            child: Container(
                alignment: Alignment.topLeft,
                child: Image(
                  width: size.width * 0.4,
                  image: const AssetImage("assets/img/ac_logo_white.png"),
                )),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        "Order#:",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.order.id.toString(),
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        "Status:",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.order.orderStatus[0].name!,
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        "Order Date:",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.order.createdAt.toString().split(" ").first,
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        "Due:",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.order.createdAt.toString().split(" ").first,
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: OrdersTable([widget.order]
                //   [
                // Orders.fromMap({
                //   "name": order.name,
                //   "size": "Large",
                //   "quantity": "2",
                //   "price": "\$300"
                // }),
                // Orders.fromMap({
                //   "name": "palao",
                //   "size": "Regular",
                //   "quantity": "1",
                //   "price": "\$200"
                // }),
                // Orders.fromMap({
                //   "name": "karahi",
                //   "size": "Full",
                //   "quantity": "4",
                //   "price": "\$1400"
                // }),
                // Orders.fromMap({
                //   "name": "korma",
                //   "size": "Half",
                //   "quantity": "3",
                //   "price": "\$1200"
                // }),
                //     ],
                ),
          ),
          SizedBox(
            width: size.width * 0.6,
            height: size.height * 0.04,
            child: DottedBorder(
                borderType: BorderType.Rect,
                radius: const Radius.circular(20),
                dashPattern: const [10, 3],
                color: const Color.fromARGB(255, 185, 65, 10),
                strokeWidth: 2,
                child: GestureDetector(
                  onTap: () {
                    if (widget.order.orderStatus[0].name!.toLowerCase() ==
                        "pending") {
                      Orders status = Orders(
                        id: widget.order.id,
                        store: widget.order.store,
                        deliveryDate: widget.order.deliveryDate,
                        orderStatus: [
                          OrderStatus(
                              name: "Ready For Ship",
                              id: widget.order.orderStatus[0].id,
                              isActive: true),
                        ],
                        name: widget.order.name,
                        deliverType: widget.order.deliverType,
                        weeklyNeeded: widget.order.weeklyNeeded,
                        totalAmount: widget.order.totalAmount,
                        disocunt: widget.order.disocunt,
                        publishedAt: widget.order.publishedAt,
                        createdAt: widget.order.createdAt,
                        updatedAt: widget.order.updatedAt,
                        // usersPermissionsUsers: order.usersPermissionsUsers,
                        // orderDetails: order.orderDetails
                      );
                      _con.updateStatus(status);
                      setState(() {});
                      //  Navigator.pop(context);
                    }
                  },
                  child: Container(
                    height: size.height * 0.04,
                    color: const Color.fromARGB(255, 242, 141, 64),
                    margin: EdgeInsets.zero,
                    // shape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular(2),
                    // ),
                    child: Row(children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Icon(Icons.local_shipping),
                      ),
                      Text("Ready for Pickup/Delivery")
                    ]),
                  ),
                )),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text("Order Subtotal: "),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "\$" + (widget.order.totalAmount * 2).toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Text("Service Fee: "),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "\$9.80",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Text("Pickup Fee: "),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "\$9.80",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text("Discount: "),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "\$" + widget.order.disocunt.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Text("Tax: "),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "\$9.80",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Text("Tip: "),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "\$9.80",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text("Order Total: "),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "\$" + (widget.order.totalAmount * 2 + 39).toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}

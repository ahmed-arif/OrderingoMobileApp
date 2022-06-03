// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:com_unrealprogrammer_orderingo/models/order_status.dart';
import 'package:com_unrealprogrammer_orderingo/models/stores.dart';

List<Orders> ordersFromJson(String str) =>
    List<Orders>.from(json.decode(str).map((x) => Orders.fromJson(x)));

String ordersToJson(List<Orders> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Orders {
  int id;
  Store store;
  DateTime deliveryDate;
  OrderStatus orderStatus;
  String name;
  OrderStatus deliverType;
  bool weeklyNeeded;
  int totalAmount;
  int disocunt;
  DateTime publishedAt;
  DateTime createdAt;
  DateTime updatedAt;
  List<dynamic> usersPermissionsUsers;
  List<dynamic> orderDetails;
  Orders({
    required this.id,
    required this.store,
    required this.deliveryDate,
    required this.orderStatus,
    required this.name,
    required this.deliverType,
    required this.weeklyNeeded,
    required this.totalAmount,
    required this.disocunt,
    required this.publishedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.usersPermissionsUsers,
    required this.orderDetails,
  });

  factory Orders.fromJson(Map<String, dynamic> json) => Orders(
        id: json["id"],
        store: Store.fromMap(json["store"]),
        deliveryDate: DateTime.parse(json["delivery_date"]),
        orderStatus: OrderStatus.fromMap(json["order_status"]),
        name: json["name"],
        deliverType: OrderStatus.fromMap(json["Deliver_type"]),
        weeklyNeeded: json["Weekly_needed"],
        totalAmount: json["Total_amount"],
        disocunt: json["Disocunt"],
        publishedAt: DateTime.parse(json["published_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        usersPermissionsUsers:
            List<dynamic>.from(json["users_permissions_users"].map((x) => x)),
        orderDetails: List<dynamic>.from(json["order_details"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "store": store.toJson(),
        "delivery_date": deliveryDate.toIso8601String(),
        "order_status": orderStatus,
        "name": name,
        "Deliver_type": deliverType,
        "Weekly_needed": weeklyNeeded,
        "Total_amount": totalAmount,
        "Disocunt": disocunt,
        "published_at": publishedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "users_permissions_users":
            List<dynamic>.from(usersPermissionsUsers.map((x) => x)),
        "order_details": List<dynamic>.from(orderDetails.map((x) => x)),
      };

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'store': store.toMap(),
      'deliveryDate': deliveryDate.millisecondsSinceEpoch,
      'orderStatus': orderStatus.toMap(),
      'name': name,
      'deliverType': deliverType.toMap(),
      'weeklyNeeded': weeklyNeeded,
      'totalAmount': totalAmount,
      'disocunt': disocunt,
      'publishedAt': publishedAt.millisecondsSinceEpoch,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
      'usersPermissionsUsers': usersPermissionsUsers,
      'orderDetails': orderDetails,
    };
  }

  factory Orders.fromMap(Map<String, dynamic> map) {
    return Orders(
      id: map['id'] as int,
      store: Store.fromMap(map['store'] as Map<String, dynamic>),
      deliveryDate:
          DateTime.fromMillisecondsSinceEpoch(map['deliveryDate'] as int),
      orderStatus:
          OrderStatus.fromMap(map['orderStatus'] as Map<String, dynamic>),
      name: map['name'] as String,
      deliverType:
          OrderStatus.fromMap(map['deliverType'] as Map<String, dynamic>),
      weeklyNeeded: map['weeklyNeeded'] as bool,
      totalAmount: map['totalAmount'] as int,
      disocunt: map['disocunt'] as int,
      publishedAt:
          DateTime.fromMillisecondsSinceEpoch(map['publishedAt'] as int),
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int),
      usersPermissionsUsers:
          List<dynamic>.from((map['usersPermissionsUsers']) as List<dynamic>),
      orderDetails: List<dynamic>.from((map['orderDetails'] as List<dynamic>)),
    );
  }
}

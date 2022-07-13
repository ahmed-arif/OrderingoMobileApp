import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:com_unrealprogrammer_orderingo/helpers/helper.dart';
import 'package:com_unrealprogrammer_orderingo/models/orders.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../helpers/app_constants.dart' as constants;

Future<Stream<Orders>> getVendorOrders() async {
  String url = "${constants.apiBaseUrl}orders";

  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  Uri uri = Uri.parse(url);

  final client = http.Client();
  try {
    var request = http.Request('get', uri);
    request.headers.addAll(requestHeaders);

    final streamedRest = await client.send(request);

    return streamedRest.stream
        .transform(utf8.decoder)
        .transform(json.decoder)
        .expand((data) => (data as List))
        .map((data) {
      return Orders.fromJson(data);
    });
  } on SocketException {
    throw const SocketException("Socket exception");
  } catch (e) {
    return Stream.value(Orders.fromJson({}));
  }
}

Future<bool> updateStatus(Orders order) async {
  String url = "${constants.apiBaseUrl}orders/${order.id}";

  var body = {
    "id": order.id,
    "store": order.store,
    "customer": null,
    "delivery_date": order.deliveryDate.toString(),
    "name": order.name,
    "Weekly_needed": order.weeklyNeeded,
    "total_amount": order.totalAmount,
    "disocunt": order.disocunt,
    "discount_code": null,
    "quantity": order.quantity,
    "published_at": order.publishedAt.toString(),
    "created_at": order.createdAt.toString(),
    "updated_at": order.updatedAt.toString(),
    "deliver_types": order.deliverType,
    "order_details": [],
    "order_statuses": [
      {
        "id": 4,
        "Name": "Process",
        "IsActive": true,
        "order": order.orderStatus[0].order,
        "published_at": order.orderStatus[0].published_at,
        "created_at": order.orderStatus[0].created_at,
        "updated_at": "2022-07-13T21:39:44.060Z"
      }
    ],
    "order_histories": []
  };

  Uri uri = Uri.parse(url);
  final client = http.Client();
  try {
    final response = await client.put(
      uri,
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
      body: json.encode(body),
    );
    log(response.body);

    Map<String, dynamic> responseJson = json.decode(response.body);

    if (response.statusCode == 200) {
      return true;
    } else {
      Fluttertoast.showToast(msg: responseJson['message']);
      return false;
    }
    // } else {
    //   print(response.reasonPhrase);
    //   Fluttertoast.showToast(msg: response.reasonPhrase!);
    //   return false;
    // }
  } catch (e) {
    print(e.toString());

    return false;
  }
}

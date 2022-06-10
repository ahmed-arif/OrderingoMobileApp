import 'dart:convert';
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
      //  print(data);
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

  Uri uri = Uri.parse(url);
  final client = http.Client();
  try {
    final response = await client.put(
      uri,
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
      body: json.encode(order.toJson()),
    );
    print(response.body);

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

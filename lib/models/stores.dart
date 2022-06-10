// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:com_unrealprogrammer_orderingo/models/image.dart';

class Store {
  int? id;
  String? storeName;
  int? usersPermissionsUser;
  bool? selfDelivery;
  double? longitude;
  double? latitude;
  String? storeopen;
  String? storeClose;
  String? promotion;
  String? allergen;
  String? publishedAt;
  String? createdAt;
  String? updatedAt;
  Image? image;
  Store({
    this.id,
    this.storeName,
    this.usersPermissionsUser,
    this.selfDelivery,
    this.longitude,
    this.latitude,
    this.storeopen,
    this.storeClose,
    this.promotion,
    this.allergen,
    this.publishedAt,
    this.createdAt,
    this.updatedAt,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'storeName': storeName,
      'usersPermissionsUser': usersPermissionsUser,
      'selfDelivery': selfDelivery,
      'longitude': longitude,
      'latitude': latitude,
      'storeopen': storeopen,
      'storeClose': storeClose,
      'promotion': promotion,
      'allergen': allergen,
      'publishedAt': publishedAt,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'image': image?.toMap(),
    };
  }

  factory Store.fromMap(Map<String, dynamic> map) {
    return Store(
      id: map['id'] != null ? map['id'] as int : null,
      storeName: map['StoreName'] != null ? map['StoreName'] as String : null,
      usersPermissionsUser: map['users_permissions_user'] != null
          ? map['users_permissions_user'] as int
          : null,
      selfDelivery:
          map['self_delivery'] != null ? map['self_delivery'] as bool : false,
      longitude: map['longitude'] != null ? map['longitude'] as double : null,
      latitude: map['Latitude'] != null ? map['Latitude'] as double : null,
      storeopen: map['Storeopen'] != null ? map['Storeopen'] as String : null,
      storeClose:
          map['StoreClose'] != null ? map['StoreClose'] as String : null,
      promotion: map['promotion'] != null ? map['promotion'] as String : null,
      allergen: map['allergen'] != null ? map['allergen'] as String : "",
      publishedAt:
          map['published_at'] != null ? map['published_at'] as String : null,
      createdAt: map['created_at'] != null ? map['created_at'] as String : null,
      updatedAt: map['updated_at'] != null ? map['updated_at'] as String : null,
      image: map['Image'] != null
          ? Image.fromMap(map['Image'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Store.fromJson(String source) =>
      Store.fromMap(json.decode(source) as Map<String, dynamic>);
}

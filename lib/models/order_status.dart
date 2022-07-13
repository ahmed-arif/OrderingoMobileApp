import 'dart:convert';

class OrderStatus {
  int? id;
  String? name;
  bool? isActive;
  String? published_at;
  String? created_at;
  String? updated_at;
  int? order;

  OrderStatus(
      {this.id,
      this.name,
      this.isActive,
      this.published_at,
      this.updated_at,
      this.order,
      this.created_at});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'isActive': isActive,
      'published_at': published_at,
      'order': order,
      'created_at': created_at,
      'updated_at': updated_at
    };
  }

  factory OrderStatus.fromMap(Map<String, dynamic> map) {
    return OrderStatus(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['Name'] != null ? map['Name'] as String : null,
      isActive: map['isActive'] != null ? map['isActive'] as bool : null,
      published_at:
          map['published_at'] != null ? map['published_at'] as String : null,
      created_at:
          map['created_at'] != null ? map['created_at'] as String : null,
      updated_at:
          map['updated_at'] != null ? map['updated_at'] as String : null,
      order: map['order'] != null ? map['order'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderStatus.fromJson(String source) =>
      OrderStatus.fromMap(json.decode(source) as Map<String, dynamic>);
}

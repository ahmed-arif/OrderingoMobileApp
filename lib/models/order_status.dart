import 'dart:convert';

class OrderStatus {
  int? id;
  String? name;
  bool? isActive;

  OrderStatus({
    this.id,
    this.name,
    this.isActive,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'isActive': isActive,
    };
  }

  factory OrderStatus.fromMap(Map<String, dynamic> map) {
    return OrderStatus(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['Name'] != null ? map['Name'] as String : null,
      isActive: map['isActive'] != null ? map['isActive'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderStatus.fromJson(String source) =>
      OrderStatus.fromMap(json.decode(source) as Map<String, dynamic>);
}

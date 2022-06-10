class DeliverTypes {
  int? id;
  String? name;
  bool? isActive;
  String? publishedAt;
  String? createdAt;
  String? updatedAt;

  DeliverTypes(
      {this.id,
      this.name,
      this.isActive,
      this.publishedAt,
      this.createdAt,
      this.updatedAt});

  DeliverTypes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['Name'];
    isActive = json['IsActive'];
    publishedAt = json['published_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Name'] = this.name;
    data['IsActive'] = this.isActive;
    data['published_at'] = this.publishedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }

  factory DeliverTypes.fromMap(Map<String, dynamic> map) {
    return DeliverTypes(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['Name'] != null ? map['Name'] as String : null,
      isActive: map['IsActive'] != null ? map['IsActive'] as bool : null,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'IsActive': isActive,
    };
  }
}

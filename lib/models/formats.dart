import 'dart:convert';

import 'package:com_unrealprogrammer_orderingo/models/thumbnail.dart';

class Formats {
  Thumbnail? thumbnail;
  Thumbnail? medium;
  Thumbnail? small;
  Formats({
    this.thumbnail,
    this.medium,
    this.small,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'thumbnail': thumbnail?.toMap(),
      'medium': medium?.toMap(),
      'small': small?.toMap(),
    };
  }

  factory Formats.fromMap(Map<String, dynamic> map) {
    return Formats(
      thumbnail: map['thumbnail'] != null
          ? Thumbnail.fromMap(map['thumbnail'] as Map<String, dynamic>)
          : null,
      medium: map['medium'] != null
          ? Thumbnail.fromMap(map['medium'] as Map<String, dynamic>)
          : null,
      small: map['small'] != null
          ? Thumbnail.fromMap(map['small'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Formats.fromJson(String source) =>
      Formats.fromMap(json.decode(source) as Map<String, dynamic>);
}

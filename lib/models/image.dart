import 'dart:convert';

import 'package:com_unrealprogrammer_orderingo/models/formats.dart';

class Image {
  int? id;
  String? name;
  String? alternativeText;
  String? caption;
  int? width;
  int? height;
  Formats? formats;
  String? hash;
  String? ext;
  String? mime;
  double? size;
  String? url;
  String? previewUrl;
  String? provider;
  String? providerMetadata;
  String? createdAt;
  String? updatedAt;
  Image({
    this.id,
    this.name,
    this.alternativeText,
    this.caption,
    this.width,
    this.height,
    this.formats,
    this.hash,
    this.ext,
    this.mime,
    this.size,
    this.url,
    this.previewUrl,
    this.provider,
    this.providerMetadata,
    this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'alternativeText': alternativeText,
      'caption': caption,
      'width': width,
      'height': height,
      'formats': formats?.toMap(),
      'hash': hash,
      'ext': ext,
      'mime': mime,
      'size': size,
      'url': url,
      'previewUrl': previewUrl,
      'provider': provider,
      'providerMetadata': providerMetadata,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory Image.fromMap(Map<String, dynamic> map) {
    return Image(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      alternativeText: map['alternativeText'] != null
          ? map['alternativeText'] as String
          : null,
      caption: map['caption'] != null ? map['caption'] as String : null,
      width: map['width'] != null ? map['width'] as int : null,
      height: map['height'] != null ? map['height'] as int : null,
      formats: map['formats'] != null
          ? Formats.fromMap(map['formats'] as Map<String, dynamic>)
          : null,
      hash: map['hash'] != null ? map['hash'] as String : null,
      ext: map['ext'] != null ? map['ext'] as String : null,
      mime: map['mime'] != null ? map['mime'] as String : null,
      size: map['size'] != null ? map['size'] as double : null,
      url: map['url'] != null ? map['url'] as String : null,
      previewUrl:
          map['previewUrl'] != null ? map['previewUrl'] as String : null,
      provider: map['provider'] != null ? map['provider'] as String : null,
      providerMetadata: map['providerMetadata'] != null
          ? map['providerMetadata'] as String
          : null,
      createdAt: map['createdAt'] != null ? map['createdAt'] as String : null,
      updatedAt: map['updatedAt'] != null ? map['updatedAt'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Image.fromJson(String source) =>
      Image.fromMap(json.decode(source) as Map<String, dynamic>);
}

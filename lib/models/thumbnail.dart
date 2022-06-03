// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Thumbnail {
  String? name;
  String? hash;
  String? ext;
  String? mime;
  int? width;
  int? height;
  double? size;
  String? path;
  String? url;
  Thumbnail({
    this.name,
    this.hash,
    this.ext,
    this.mime,
    this.width,
    this.height,
    this.size,
    this.path,
    this.url,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'hash': hash,
      'ext': ext,
      'mime': mime,
      'width': width,
      'height': height,
      'size': size,
      'path': path,
      'url': url,
    };
  }

  factory Thumbnail.fromMap(Map<String, dynamic> map) {
    return Thumbnail(
      name: map['name'] != null ? map['name'] as String : null,
      hash: map['hash'] != null ? map['hash'] as String : null,
      ext: map['ext'] != null ? map['ext'] as String : null,
      mime: map['mime'] != null ? map['mime'] as String : null,
      width: map['width'] != null ? map['width'] as int : null,
      height: map['height'] != null ? map['height'] as int : null,
      size: map['size'] != null ? map['size'] as double : null,
      path: map['path'] != null ? map['path'] as String : null,
      url: map['url'] != null ? map['url'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Thumbnail.fromJson(String source) =>
      Thumbnail.fromMap(json.decode(source) as Map<String, dynamic>);
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class GiphyResourceModel {
  GiphyResourceModel({
    required this.id,
    required this.username,
    required this.url,
  });

  final String id;
  final String username;
  final String url;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'url': url,
    };
  }

  factory GiphyResourceModel.fromMap(Map<String, dynamic> map) {
    return GiphyResourceModel(
      id: map['id'] as String,
      username: map['username'] as String,
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(
        toMap(),
      );

  factory GiphyResourceModel.fromJson(String source) => GiphyResourceModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );
}

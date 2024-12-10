// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class GiphyResourceModel {
  GiphyResourceModel({
    required this.id,
    required this.title,
    required this.username,
    required this.url,
  });

  final String id;
  final String title;
  final String username;
  final String url;

  factory GiphyResourceModel.fromMap(Map<String, dynamic> map) {
    return GiphyResourceModel(
      id: map['id'] as String,
      title: map['title'] as String,
      username: map['username'] as String,
      url: map['images']['original']['url'] as String,
    );
  }

  factory GiphyResourceModel.fromJson(String source) => GiphyResourceModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  static List<GiphyResourceModel> getListFromJson(String source) {
    final jsonConverted = json.decode(source) as Map<String, dynamic>;
    final list = jsonConverted["data"] as List<dynamic>;

    return List.generate(
      list.length,
      (index) {
        final map = list[index];
        return GiphyResourceModel.fromMap(map);
      },
    );
  }

  String get fileTitle {
    return title.isEmpty ? id : title;
  }
}

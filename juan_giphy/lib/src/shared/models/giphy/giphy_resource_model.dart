// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class GiphyResourceModel {
  GiphyResourceModel({
    required this.id,
    required this.username,
    required this.url,
    this.usernamePhotoUrl,
  });

  final String id;
  final String username;
  final String url;
  final String? usernamePhotoUrl;

  factory GiphyResourceModel.fromMap(Map<String, dynamic> map) {
    return GiphyResourceModel(
      id: map['id'] as String,
      username: map['username'] as String,
      url: map['images']['original']['url'] as String,
      usernamePhotoUrl: map['user']?['avatar_url'] as String?,
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
}

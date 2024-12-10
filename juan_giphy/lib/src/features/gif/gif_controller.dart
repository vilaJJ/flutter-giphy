import 'dart:typed_data';

import 'package:juan_giphy/src/shared/helpers/share/share_helper.dart';
import 'package:juan_giphy/src/shared/models/giphy/giphy_resource_model.dart';
import 'package:juan_giphy/src/shared/services/http/http_service.dart';

class GifController {
  final _httpService = HttpService();

  Future<void> shareGif(GiphyResourceModel gif) async {
    final bytes = await _getBytesFromUrlResource(gif.url);
    await ShareHelper.shareFileBytes(bytes, "image/gif");
  }

  Future<Uint8List> _getBytesFromUrlResource(String urlResource) async {
    final response = await _httpService.get(Uri.parse(urlResource));
    return response.bodyBytes;
  }
}

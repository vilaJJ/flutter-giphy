import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:juan_giphy/src/shared/helpers/share/share_helper.dart';
import 'package:juan_giphy/src/shared/models/giphy/giphy_resource_model.dart';
import 'package:juan_giphy/src/shared/services/http/http_service.dart';

class GifController {
  final ValueNotifier<bool> isSharing = ValueNotifier(false);

  final _httpService = HttpService();

  Future<void> shareGif(GiphyResourceModel gif) async {
    try {
      isSharing.value = true;

      final bytes = await _getBytesFromUrlResource(gif.url);
      await ShareHelper.shareFileBytes(bytes, "${gif.fileTitle}.gif", "image/gif");
    } finally {
      isSharing.value = false;
    }
  }

  Future<Uint8List> _getBytesFromUrlResource(String urlResource) async {
    final response = await _httpService.get(Uri.parse(urlResource));
    return response.bodyBytes;
  }
}

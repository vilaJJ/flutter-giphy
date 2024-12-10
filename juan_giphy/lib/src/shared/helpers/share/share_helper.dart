import 'dart:typed_data';

import 'package:share_plus/share_plus.dart';

class ShareHelper {
  ShareHelper._();

  static Future<void> shareFileBytes(Uint8List bytes, String mimeType) async {
    final file = XFile.fromData(
      bytes,
      mimeType: mimeType,
    );
    await Share.shareXFiles([file]);
  }
}
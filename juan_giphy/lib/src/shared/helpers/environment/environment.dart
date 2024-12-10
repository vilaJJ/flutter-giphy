import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:juan_giphy/src/shared/constants/dot_env_constants.dart';

class Environment {
  Environment._();

  static String get giphyApiKey {
    return dotenv.get(
      Platform.isAndroid ? DotEnvConstants.giphyAndroidApiKey : DotEnvConstants.giphyIosApiKey,
    );
  }
}

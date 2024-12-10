import 'package:juan_giphy/src/shared/constants/web_resources_constants.dart';
import 'package:juan_giphy/src/shared/helpers/api/api_helper.dart';
import 'package:juan_giphy/src/shared/helpers/environment/environment.dart';

class GiphyApiHelper extends ApiHelper {
  GiphyApiHelper._({
    required super.baseUrl,
  }) {
    apiKey = Environment.giphyApiKey;
  }

  late final String apiKey;

  factory GiphyApiHelper.gifs() {
    return GiphyApiHelper._(
      baseUrl: WebResourcesConstants.giphyApiBaseUrl,
    );
  }
}

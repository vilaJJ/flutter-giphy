import 'package:juan_giphy/src/shared/constants/web_resources_constants.dart';
import 'package:juan_giphy/src/shared/helpers/api/api_helper.dart';

class GiphyApiHelper extends ApiHelper {
  GiphyApiHelper._({
    required super.baseUrl,
  });

  factory GiphyApiHelper.gifs() {
    return GiphyApiHelper._(
      baseUrl: "${WebResourcesConstants.giphyApiBaseUrl}/gifs",
    );
  }
}

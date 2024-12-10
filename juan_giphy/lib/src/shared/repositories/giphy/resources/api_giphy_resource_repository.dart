import 'package:juan_giphy/src/shared/helpers/api/giphy_api_helper.dart';
import 'package:juan_giphy/src/shared/models/giphy/giphy_resource_model.dart';
import 'package:juan_giphy/src/shared/repositories/giphy/resources/giphy_resource_repository.dart';

class ApiGiphyResourceRepository implements GiphyResourceRepository {
  final _helper = GiphyApiHelper.gifs();

  @override
  Future<List<GiphyResourceModel>> getBySearch(
    String text, {
    int limit = 25,
    int offset = 0,
  }) async {
    final uri = _helper.getUri(
      "v1/gifs/search",
      parameters: {
        "api_key": _helper.apiKey,
        "q": text,
        "limit": "$limit",
        "offset": "$offset",
      },
    );

    final response = await _helper.get(uri);
    return GiphyResourceModel.getListFromJson(response.body);
  }

  @override
  Future<List<GiphyResourceModel>> getTrending({
    int limit = 25,
    int offset = 0,
  }) async {
    final uri = _helper.getUri(
      "v1/gifs/trending",
      parameters: {
        "api_key": _helper.apiKey,
        "limit": "$limit",
        "offset": "$offset",
      },
    );

    final response = await _helper.get(uri);
    return GiphyResourceModel.getListFromJson(response.body);
  }
}

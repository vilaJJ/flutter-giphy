import 'package:juan_giphy/src/shared/helpers/api/giphy_api_helper.dart';
import 'package:juan_giphy/src/shared/models/giphy/giphy_resource_model.dart';
import 'package:juan_giphy/src/shared/repositories/giphy/resources/giphy_resource_repository.dart';

class ApiGiphyResourceRepository implements GiphyResourceRepository {
  final helper = GiphyApiHelper.gifs();

  @override
  Future<List<GiphyResourceModel>> getBySearch(
    String text, {
    int limit = 25,
    int offset = 0,
  }) {
    // TODO: implement getBySearch
    throw UnimplementedError();
  }

  @override
  Future<List<GiphyResourceModel>> getTrending({
    int limit = 25,
    int offset = 0,
  }) async {
    final uri = helper.getUri(
      "trending",
      parameters: {
        "api_key": "",
        "limit": "$limit",
        "offset": "$offset"
      },
    );
    final response = await helper.get(uri);
    // TODO: implement getTrending
    throw UnimplementedError();
  }
}

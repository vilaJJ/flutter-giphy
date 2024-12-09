import 'package:juan_giphy/src/shared/models/giphy/giphy_resource_model.dart';

abstract class GiphyResourceRepository {
  Future<List<GiphyResourceModel>> getBySearch(
    String text, {
    int limit = 25,
    int offset = 0,
  });
  Future<List<GiphyResourceModel>> getTrending({
    int limit = 25,
    int offset = 0,
  });
}

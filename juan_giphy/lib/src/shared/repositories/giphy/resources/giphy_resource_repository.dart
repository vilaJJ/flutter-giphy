import 'package:juan_giphy/src/shared/models/giphy/giphy_resource_model.dart';

abstract class GiphyResourceRepository {
  Future<List<GiphyResourceModel>> getTrending();
  Future<List<GiphyResourceModel>> search(String text);
}

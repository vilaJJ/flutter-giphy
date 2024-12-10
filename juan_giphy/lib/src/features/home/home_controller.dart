import 'package:juan_giphy/src/shared/models/giphy/giphy_resource_model.dart';
import 'package:juan_giphy/src/shared/repositories/giphy/resources/api_giphy_resource_repository.dart';
import 'package:juan_giphy/src/shared/repositories/giphy/resources/giphy_resource_repository.dart';

class HomeController {
  final GiphyResourceRepository giphyResourceRepository = ApiGiphyResourceRepository();
  String? _searchText;

  String? get searchText => _searchText;

  Future<List<GiphyResourceModel>?> getGifs() async {
    try {
      if (searchText?.trim().isNotEmpty == true) {
        return await giphyResourceRepository.getBySearch(searchText!);
      }

      return await giphyResourceRepository.getTrending();
    } catch (_) {
      return null;
    }
  }

  void setSearchText(String? text) {
    _searchText = text;
  }

  void clearSearchText() {
    _searchText = null;
  }
}

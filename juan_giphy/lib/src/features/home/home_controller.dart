import 'package:juan_giphy/src/shared/models/giphy/giphy_resource_model.dart';
import 'package:juan_giphy/src/shared/repositories/giphy/resources/api_giphy_resource_repository.dart';
import 'package:juan_giphy/src/shared/repositories/giphy/resources/giphy_resource_repository.dart';

class HomeController {
  final GiphyResourceRepository giphyResourceRepository = ApiGiphyResourceRepository();
  String? _searchText;

  String? get searchText => _searchText;

  Future<List<GiphyResourceModel>> getGifs() async {
    if (_searchText?.trim().isNotEmpty == true) {
      return await giphyResourceRepository.getBySearch(_searchText!);
    }

    return await giphyResourceRepository.getTrending();
  }

  void setSearchText(String? text) {
    _searchText = text;
  }

  void clearSearchText() {
    _searchText = null;
  }
}

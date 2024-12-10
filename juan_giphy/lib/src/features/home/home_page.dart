import 'package:flutter/material.dart';
import 'package:juan_giphy/src/features/gif/gif_page.dart';
import 'package:juan_giphy/src/features/home/home_controller.dart';
import 'package:juan_giphy/src/shared/models/giphy/giphy_resource_model.dart';
import 'package:juan_giphy/src/shared/widgets/error_card.dart';
import 'package:juan_giphy/src/shared/widgets/gif_card.dart';
import 'package:juan_giphy/src/shared/widgets/giphy_developers_logo.dart';
import 'package:juan_giphy/src/shared/widgets/loading_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  final searchFieldController = TextEditingController();
  final searchFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const GiphyDevelopersLogo(),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Column(
          children: [
            TextField(
              controller: searchFieldController,
              focusNode: searchFocusNode,
              onSubmitted: _onSearchFieldSubmit,
              decoration: InputDecoration(
                iconColor: Colors.white,
                labelText: "Search",
                prefixIcon: const Icon(Icons.search_rounded, color: Colors.white),
                suffixIcon: Visibility(
                  visible: searchFieldController.text.isNotEmpty,
                  child: IconButton(
                    onPressed: _onDeleteTextPressed,
                    icon: const Icon(Icons.close, color: Colors.white),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                labelStyle: const TextStyle(
                  color: Colors.white,
                ),
              ),
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            FutureBuilder(
              future: controller.getGifs(),
              builder: (context, snapshot) {
                final connectionState = snapshot.connectionState;

                if (connectionState == ConnectionState.waiting) {
                  return const Expanded(
                    child: Center(
                      child: LoadingCard(
                        text: "Carregando os GIFs...",
                      ),
                    ),
                  );
                }

                if (connectionState == ConnectionState.none || snapshot.data == null) {
                  return const Expanded(
                    child: Center(
                      child: ErrorCard(
                        message: "Não foi possível carregar os GIFs.\nTente novamente mais tarde.",
                      ),
                    ),
                  );
                }

                final gifList = snapshot.requireData!;

                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(2, 8, 2, 0),
                    child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: gifList.length,
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      itemBuilder: (context, index) {
                        final gif = gifList[index];

                        return InkWell(
                          onTap: () async => await _onGifPressed(gif),
                          child: GifCard(
                            url: gif.url,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _onSearchFieldSubmit(String text) {
    text = text.trim();

    if (text.isEmpty || text == controller.searchText) {
      return;
    }

    setState(() {
      controller.setSearchText(text);
    });
  }

  void _onDeleteTextPressed() {
    _closeSearchFieldKeyboard();
    searchFieldController.clear();

    setState(() {
      controller.clearSearchText();
    });
  }

  Future<void> _onGifPressed(GiphyResourceModel gif) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => GifPage(gif),
      ),
    );
  }

  void _closeSearchFieldKeyboard() {
    searchFocusNode.unfocus();
  }
}

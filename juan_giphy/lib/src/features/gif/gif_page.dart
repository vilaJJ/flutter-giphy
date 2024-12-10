import 'package:flutter/material.dart';
import 'package:juan_giphy/src/features/gif/gif_controller.dart';
import 'package:juan_giphy/src/shared/models/giphy/giphy_resource_model.dart';
import 'package:juan_giphy/src/shared/widgets/gif_card.dart';

class GifPage extends StatefulWidget {
  const GifPage(
    this.gif, {
    super.key,
  });

  final GiphyResourceModel gif;

  @override
  State<GifPage> createState() => _GifPageState();
}

class _GifPageState extends State<GifPage> {
  final controller = GifController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: GifCard(
          url: widget.gif.url,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onSharePressed,
        child: const Icon(Icons.share_rounded),
      ),
    );
  }

  Future<void> _onSharePressed() async {
    await controller.shareGif(widget.gif);
  }
}

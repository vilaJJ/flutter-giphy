import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class GifCard extends StatelessWidget {
  const GifCard({
    super.key,
    required this.url,
    this.fit,
  });

  final String url;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      progressIndicatorBuilder: (context, url, progress) => Center(
        child: CircularProgressIndicator(
          value: progress.progress,
        ),
      ),
      errorWidget: (context, url, error) => const Icon(
        Icons.error_outline_rounded,
        color: Colors.white,
      ),
      fit: fit,
    );
  }
}

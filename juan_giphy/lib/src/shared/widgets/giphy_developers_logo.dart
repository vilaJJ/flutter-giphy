import 'package:flutter/material.dart';
import 'package:juan_giphy/src/shared/constants/assets_constants.dart';

class GiphyDevelopersLogo extends StatelessWidget {
  const GiphyDevelopersLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AssetsConstants.giphyDevelopers,
      fit: BoxFit.fitWidth,
    );
  }
}

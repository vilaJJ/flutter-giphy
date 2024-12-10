import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:juan_giphy/src/app_widget.dart';
import 'package:juan_giphy/src/shared/constants/assets_constants.dart';

Future<void> main() async {
  await dotenv.load(fileName: AssetsConstants.dotenv);
  runApp(const AppWidget());
}

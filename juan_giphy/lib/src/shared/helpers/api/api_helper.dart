import 'package:juan_giphy/src/shared/services/http/http_service.dart';

abstract class ApiHelper extends HttpService {
  ApiHelper({
    required this.baseUrl,
    this.isHttps = true,
  });

  final String baseUrl;
  final bool isHttps;

  Uri getUri(
    String endpoint, {
    Map<String, String>? parameters,
  }) {
    return isHttps
        ? Uri.https(
            baseUrl,
            endpoint,
            parameters,
          )
        : Uri.http(
            baseUrl,
            endpoint,
            parameters,
          );
  }
}

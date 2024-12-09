import 'package:http/http.dart';

class HttpResponseModel {
  HttpResponseModel._({
    required this.success,
    required this.statusCode,
    required this.headers,
    required this.body,
  });

  final bool success;
  final int statusCode;
  final Map<String, dynamic> headers;
  final String body;

  factory HttpResponseModel.fromResponse(Response response) {
    final statusCode = response.statusCode;

    return HttpResponseModel._(
      success: statusCode >= 200 && statusCode < 400,
      statusCode: statusCode,
      headers: response.headers,
      body: response.body,
    );
  }
}

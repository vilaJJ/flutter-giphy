import 'package:http/http.dart' as http;
import 'package:juan_giphy/src/shared/exceptions/http/client/bad_request_http_exception.dart';
import 'package:juan_giphy/src/shared/exceptions/http/client/forbidden_http_exception.dart';
import 'package:juan_giphy/src/shared/exceptions/http/client/method_not_allowed_http_exception.dart';
import 'package:juan_giphy/src/shared/exceptions/http/client/not_found_http_exception.dart';
import 'package:juan_giphy/src/shared/exceptions/http/client/unathourized_http_exception.dart';
import 'package:juan_giphy/src/shared/exceptions/http/http_exception.dart';
import 'package:juan_giphy/src/shared/exceptions/http/server/bad_gateway_http_exception.dart';
import 'package:juan_giphy/src/shared/exceptions/http/server/gateway_timeout_http_exception.dart';
import 'package:juan_giphy/src/shared/exceptions/http/server/internal_server_error_http_exception.dart';
import 'package:juan_giphy/src/shared/exceptions/http/server/service_unavaliable_http_exception.dart';
import 'package:juan_giphy/src/shared/models/http/http_response_model.dart';

class HttpService {
  Future<HttpResponseModel> get(
    Uri uri, {
    Map<String, String>? headers,
  }) async {
    final response = await http.get(
      uri,
      headers: headers,
    );

    return _getResponse(response);
  }

  HttpResponseModel _getResponse(http.Response response) {
    final httpResponse = HttpResponseModel.fromResponse(response);
    return httpResponse.success ? httpResponse : throw _getException(httpResponse.statusCode);
  }

  HttpException _getException(int statusCode) {
    return switch (statusCode) {
      400 => BadRequestHttpException(),
      401 => UnathourizedHttpException(),
      403 => ForbiddenHttpException(),
      404 => NotFoundHttpException(),
      405 => MethodNotAllowedHttpException(),
      500 => InternalServerErrorHttpException(),
      502 => BadGatewayHttpException(),
      503 => ServiceUnavaliableHttpException(),
      504 => GatewayTimeoutHttpException(),
      _ => HttpException(),
    };
  }
}

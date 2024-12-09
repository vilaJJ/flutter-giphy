import 'package:juan_giphy/src/shared/exceptions/http/http_exception.dart';

class ServiceUnavaliableHttpException extends HttpException {
  ServiceUnavaliableHttpException()
      : super(
          message: "O servidor não está pronto para manipular a requisição.",
        );
}

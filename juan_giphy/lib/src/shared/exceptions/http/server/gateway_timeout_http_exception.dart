import 'package:juan_giphy/src/shared/exceptions/http/http_exception.dart';

class GatewayTimeoutHttpException extends HttpException {
  GatewayTimeoutHttpException()
      : super(
          message: "O servidor não conseguiu obter uma resposta a tempo.",
        );
}
import 'package:juan_giphy/src/shared/exceptions/http/http_exception.dart';

class BadGatewayHttpException extends HttpException {
  BadGatewayHttpException()
      : super(
          message: "O servidor obteve uma resposta inválida.",
        );
}

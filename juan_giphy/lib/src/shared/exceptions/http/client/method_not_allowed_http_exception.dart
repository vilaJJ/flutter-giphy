import 'package:juan_giphy/src/shared/exceptions/http/http_exception.dart';

class MethodNotAllowedHttpException extends HttpException {
  MethodNotAllowedHttpException()
      : super(
          message: "O método do recurso solicitado não é suportado.",
        );
}
import 'package:juan_giphy/src/shared/exceptions/http/http_exception.dart';

class ForbiddenHttpException extends HttpException {
  ForbiddenHttpException()
      : super(
          message: "O cliente não está autorizado para utilizar o recurso do serviço.",
        );
}

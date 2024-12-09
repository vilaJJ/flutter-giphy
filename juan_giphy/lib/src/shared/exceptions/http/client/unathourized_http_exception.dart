import 'package:juan_giphy/src/shared/exceptions/http/http_exception.dart';

class UnathourizedHttpException extends HttpException {
  UnathourizedHttpException()
      : super(
          message: "O cliente não está autenticado para utilizar o serviço.",
        );
}

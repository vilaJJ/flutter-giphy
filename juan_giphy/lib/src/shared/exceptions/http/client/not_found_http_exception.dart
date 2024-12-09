import 'package:juan_giphy/src/shared/exceptions/http/http_exception.dart';

class NotFoundHttpException extends HttpException {
  NotFoundHttpException()
      : super(
          message: "O recurso solicitado não foi encontrado.",
        );
}

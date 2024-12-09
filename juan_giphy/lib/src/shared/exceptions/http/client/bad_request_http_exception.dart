import 'package:juan_giphy/src/shared/exceptions/http/http_exception.dart';

class BadRequestHttpException extends HttpException {
  BadRequestHttpException()
      : super(
          message: "O servidor não pode processar a informação, devido a uma não-conformidade por parte do cliente.",
        );
}
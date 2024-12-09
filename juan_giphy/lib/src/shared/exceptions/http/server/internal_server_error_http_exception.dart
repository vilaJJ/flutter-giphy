import 'package:juan_giphy/src/shared/exceptions/http/http_exception.dart';

class InternalServerErrorHttpException extends HttpException {
  InternalServerErrorHttpException()
      : super(
          message: "O servidor encontrou uma situação com a qual não sabe lidar.",
        );
}

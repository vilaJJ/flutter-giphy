class HttpException implements Exception {
  final String message;

  HttpException({
    this.message = "Não-conformidade desconhecida.",
  });

  @override
  String toString() {
    return message;
  }
}
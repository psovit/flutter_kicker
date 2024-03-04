abstract class StringifyException implements Exception {
  const StringifyException([this.message]);

  final String? message;

  @override
  String toString() {
    if (message == null) {
      return "Instance of '$runtimeType'";
    }
    return '$runtimeType: $message';
  }
}

class ApiException extends StringifyException {
  const ApiException(this.statusCode, [String? message]) : super(message);
  final int statusCode;
}

class ServerException extends ApiException {
  const ServerException(int statusCode, [String? message])
      : super(statusCode, message);
}

class ClientException extends ApiException {
  const ClientException(int statusCode, [String? message])
      : super(statusCode, message);
}

class InvalidCredentialsException extends ApiException {
  const InvalidCredentialsException(int statusCode, [String? message])
      : super(statusCode, message);
}

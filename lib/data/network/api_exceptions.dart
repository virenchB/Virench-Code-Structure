class ApiException implements Exception {
  final _message;
  final _prefix;

  ApiException([this._message, this._prefix]);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class InternetException extends ApiException {
  InternetException([String? message]) : super(message, "No Internet : ");
}

class ServerException extends ApiException {
  ServerException([String? message])
      : super(message, "Internal Server Error : ");
}

class RequestTimeoutException extends ApiException {
  RequestTimeoutException([String? message])
      : super(message, "Request Time Out : ");
}

class BadRequestException extends ApiException {
  BadRequestException([message]) : super(message, "Invalid Request : ");
}

class UnauthorisedRequestException extends ApiException {
  UnauthorisedRequestException([message])
      : super(message, "Unauthorised Request : ");
}

class InvalidInputException extends ApiException {
  InvalidInputException([String? message]) : super(message, "Invalid Input : ");
}

class FetchDataException extends ApiException {
  FetchDataException([String? message])
      : super(message, "Error While Communication : ");
}

class DefaultException extends ApiException {
  DefaultException([String? message])
      : super(message, "Something went wrong...");
}

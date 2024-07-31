abstract class Failure {
  final String errMessage;

  Failure({required this.errMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errMessage});

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (response is Map<String, dynamic>) {
      if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
        return ServerFailure(
            errMessage: response['error']['message'] ?? 'Unknown error');
      } else if (statusCode == 404) {
        return ServerFailure(
            errMessage: 'Your request was not found, please try again later!');
      } else if (statusCode == 500) {
        return ServerFailure(
            errMessage: 'Internal server problem, please try again later!');
      } else {
        return ServerFailure(
            errMessage: 'Oops, there was an error, please try again later!');
      }
    } else {
      return ServerFailure(
          errMessage: 'Unexpected error occurred. Please try again later.');
    }
  }
}

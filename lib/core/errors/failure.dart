import 'package:dio/dio.dart';

abstract class Failure {
  final String errMsg;

  Failure(this.errMsg);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMsg);

  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectTimeout:
        return ServerFailure("ConnectionTimeout Error, try again later!");
      case DioErrorType.sendTimeout:
        return ServerFailure("sendTimeout Error, try again later!");
      case DioErrorType.receiveTimeout:
        return ServerFailure("receiveTimeout Error, try again later!");
      case DioErrorType.response:
        return ServerFailure.FromResponse(
            dioError.response!.statusCode, dioError.response!.data);
      case DioErrorType.cancel:
        return ServerFailure("Api Request has been Canceled");
      case DioErrorType.other:
        if (dioError.message.contains('SocketExeption')) {
          return ServerFailure("No Internet Connection");
        }
        return ServerFailure("UnExepected Error, Try again ");
      default:
        return ServerFailure("Ops There's an Error, try again later!");
    }
  }

  factory ServerFailure.FromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 402) {
      return ServerFailure(response['error']['massege']);
    } else if (statusCode == 404) {
      return ServerFailure("Your Request Not Found");
    } else if (statusCode == 500) {
      return ServerFailure("Internal Server error, Please Try again!");
    } else {
      return ServerFailure("Ops There's an Error, try again later!");
    }
  }
}

import 'package:equatable/equatable.dart';

class ServerException extends Equatable implements Exception {
  const ServerException({
    required this.message,
    required this.statusCode,
  });
  final String message;
  final String statusCode;
  List<dynamic> get props => [message, statusCode];
}

class CacheExceptions {
  const CacheExceptions({
    required this.message,
    required this.statusCode,
  });

  final String message;
  final int statusCode;

  List<dynamic> get props => [message, statusCode];
}

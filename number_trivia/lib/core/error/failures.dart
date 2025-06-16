import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure();

  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  // final String message;

  // const ServerFailure(this.message);

  // @override
  // List<Object?> get props => [message];

  // @override
  // String toString() => 'ServerFailure: $message';
}

class CacheFailure extends Failure {
  // final String message;

  // const CacheFailure(this.message);

  // @override
  // List<Object?> get props => [message];

  // @override
  // String toString() => 'CacheFailure: $message';
}
// class NetworkFailure extends Failure {
//   final String message;

//   const NetworkFailure(this.message);

//   @override
//   List<Object?> get props => [message];

//   @override
//   String toString() => 'NetworkFailure: $message';
// }

class InvalidInputFailure extends Failure {
  // final String message;

  // const InvalidInputFailure(this.message);

  // @override
  // List<Object?> get props => [message];

  // @override
  // String toString() => 'InvalidInputFailure: $message';
}

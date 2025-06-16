part of 'number_trivia_bloc.dart';

@immutable
sealed class NumberTriviaState {}

final class Empty extends NumberTriviaState {}

final class Loading extends NumberTriviaState {}

class Loaded extends NumberTriviaState {
  final NumberTrivia trivia;
  Loaded({required this.trivia});
}

final class Error extends NumberTriviaState {
  final String message;
  Error({required this.message});
}

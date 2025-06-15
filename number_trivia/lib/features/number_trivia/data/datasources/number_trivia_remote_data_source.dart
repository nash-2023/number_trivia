import 'package:number_trivia/core/error/exceptions.dart';
import 'package:number_trivia/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class NumberTriviaRemoteDataSource {
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number);
  Future<NumberTriviaModel> getRandomNumberTrivia();
}

class NumberTriviaRemoteDataSourceImpl implements NumberTriviaRemoteDataSource {
  // This is a placeholder for the actual implementation.
  // In a real application, this would make HTTP requests to an API.

  @override
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number) async {
    final String url = 'http://numbersapi.com/$number?json';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode != 200) {
      throw ServerException();
    } else {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      return NumberTriviaModel.fromJson(jsonResponse);
    }
  }

  @override
  Future<NumberTriviaModel> getRandomNumberTrivia() async {
    final String url = 'http://numbersapi.com/random?json';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode != 200) {
      throw ServerException();
    } else {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      return NumberTriviaModel.fromJson(jsonResponse);
    }
  }
}

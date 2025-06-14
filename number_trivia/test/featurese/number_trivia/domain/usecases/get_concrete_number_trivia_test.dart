import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:number_trivia/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:number_trivia/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  late GetConcreteNumberTrivia usecase;
  late MockNumberTriviaRepository mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository);
  });

  final tNumber = 1;
  final tNumberTrivia = NumberTrivia(number: 1, text: 'test');

  test('should get trivia for the number from the repository', () async {
    // "On the fly" implementation of the Repository using the Mockito package.
    // When getConcreteNumberTrivia is called with any argument, always answer with
    // the Right "side" of Either containing a test NumberTrivia object.
    when(
      mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber),
    ).thenAnswer((_) async => Right(tNumberTrivia));
    // The "act" phase of the test. Call the not-yet-existent method.
    final result = await usecase(tNumber);
    // UseCase should simply return whatever was returned from the Repository
    expect(result, Right(tNumberTrivia));
    // Verify that the method has been called on the Repository
    verify(mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber));
    // Only the above method should be called and nothing more.
    verifyNoMoreInteractions(mockNumberTriviaRepository);
  });
}


// import 'package:dartz/dartz.dart';
// import 'package:number_trivia/featurese/number_trivia/domain/entities/number_trivia.dart';
// import 'package:number_trivia/featurese/number_trivia/domain/repositories/number_trivia_repository.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:number_trivia/featurese/number_trivia/domain/usecases/get_concrete_number_trivia.dart';

// class MockNumberTriviaRepository extends Mock
//     implements NumberTriviaRepository {}

// void main() {
//   GetConcreteNumberTrivia usecase;
//   MockNumberTriviaRepository mockNumberTriviaRepository;

//   setUp(() {
//     mockNumberTriviaRepository = MockNumberTriviaRepository();
//     usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository);
//   });

//   const tNumber = 1;    
//   final tNumberTrivia = NumberTrivia(text: 'Test trivia', number: 1); // Assuming NumberTrivia is defined in the domain/entities folder

//   test('should get trivia for the number from the repository', () async {
//     // Arrange
//     when(mockNumberTriviaRepository.getConcreteNumberTrivia(any))
//         .thenAnswer((_) async => Right(tNumberTrivia));
//     const tNumber = 1;
//     // Act
//     usecase(tNumber);
//     // Assert
//     verify(mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber));
//     verifyNoMoreInteractions(mockNumberTriviaRepository);
//   });
// }

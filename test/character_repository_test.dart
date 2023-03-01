import 'package:api_example/shared/api/character_endpoint.dart';
import 'package:api_example/shared/repository/character_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:faker/faker.dart';
import 'shared/api_factory.dart';
import 'package:dio/dio.dart';

class CharacterEndpointMock extends Mock implements CharacterEndpoint {}

void main() {
  late CharacterEndpointMock characterEndpointMock;
  late CharacterRepository characterRepository;
  setUp(() {
    characterEndpointMock = CharacterEndpointMock();
    characterRepository =
        CharacterRepository(characterEndpoint: characterEndpointMock);
  });
  test(
      'WHEN getAllCharacters is requested by CharacterRepository THEN getAllCharacters from CharactersEndpoint is called ',
      () async {
    when((() => characterEndpointMock.getAllCharacters())).thenAnswer(
        (_) async => Response(
            data: ApiFactory.getAllCharacters(),
            requestOptions: RequestOptions(path: faker.internet.httpUrl())));
    await characterRepository.getAllCharacters();
    verify(() => characterEndpointMock.getAllCharacters()).called(1);
  });
}

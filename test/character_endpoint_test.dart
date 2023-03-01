import 'package:api_example/shared/api/character_endpoint.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dio/dio.dart';
import 'shared/api_factory.dart';

class DioMock extends Mock implements Dio {}

void main() {
  late Response<Map<String, dynamic>> sucess;
  late DioMock dioMock;
  late CharacterEndpoint characterEndpoint;

  When mockGetResponse() => when(
      () => dioMock.get(any(), queryParameters: any(named: 'queryParameters')));

  mockResponse(Map<String, dynamic> factory, int statusCode) => Response(
      data: factory,
      statusCode: statusCode,
      requestOptions: RequestOptions(path: faker.internet.httpUrl()));

  setUp(() {
    dioMock = DioMock();
    characterEndpoint = CharacterEndpoint(dioMock);
  });

  setUp(() {
    sucess = mockResponse(ApiFactory.getAllCharacters(), 200);
  });
  test('WHEN getAllTransactions is requested THEN returns 200', (() async {
    mockGetResponse().thenAnswer((_) async => sucess);
    final result = await characterEndpoint.getAllCharacters();
    expect(result.statusCode, equals(200));
    expect(result, sucess);
  }));
}

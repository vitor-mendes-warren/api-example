import 'package:api_example/shared/repository/character_repository.dart';
// ignore: depend_on_referenced_packages
import 'package:riverpod/riverpod.dart';
import '../api/character_enpoint_provider.dart';

final characterRepositoryProvider = Provider((ref) {
  return CharacterRepository(
      characterEndpoint: ref.read(characterEndpointProvider));
});

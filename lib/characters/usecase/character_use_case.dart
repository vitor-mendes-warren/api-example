import 'package:api_example/shared/repository/character_repository.dart';
import '../model/character_view_data.dart';
import '../mapper/character_mapper.dart';

class GetCharactersUseCase {
  final CharacterRepository repository;
  GetCharactersUseCase({required this.repository});

  Future<List<CharacterViewData>> execute() async {
    final response = await repository.getAllCharacters();

    return response.toViewData();
  }
}

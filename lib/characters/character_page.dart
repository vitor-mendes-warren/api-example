import 'package:api_example/components/text_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'character_provider.dart';

class CharactersPage extends ConsumerWidget {
  const CharactersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getCharactersProvider = ref.watch(charactersProvider);

    return Scaffold(
      body: Center(
        child: getCharactersProvider.when(
            data: (data) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                        children: data
                            .map((character) => TextInfo(text: character.name))
                            .toList()),
                  ],
                ),
            error: (error, stackTrace) => const Text('Ooops, erro!'),
            loading: () => const CircularProgressIndicator()),
      ),
    );
  }
}

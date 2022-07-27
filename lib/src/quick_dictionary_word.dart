import 'dart:collection';

import 'quick_dictionary_base.dart';
import 'quick_dictionary_sound.dart';

class Word {
  final Language language;

  final String wordText;

  final List<Sound> sounds;

  final List<WordDefinition> _definitions;

  Word(this.language, this.wordText, this.sounds,
      Iterable<WordDefinition> definitions)
      : _definitions = definitions.toList();

  Set<WordType> get types => _definitions.map((e) => e.type).toSet();

  List<WordDefinition> get definitions => UnmodifiableListView(_definitions);

  bool addDefinition(WordDefinition definition) {
    if (!_definitions.contains(definition)) {
      _definitions.add(definition);
      return true;
    }
    return false;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Word &&
          runtimeType == other.runtimeType &&
          language == other.language &&
          wordText == other.wordText;

  @override
  int get hashCode => language.hashCode ^ wordText.hashCode;

  @override
  String toString() {
    return 'Word<$wordText>{language: ${language.code}, types: ${types.map((e) => e.name).toList()}, sounds: ${sounds.join('_')}}';
  }
}

enum WordType {
  article,
  preposition,
  pronoun,
  adverb,
  interjection,
  adjective,
  noun,
  verb,
  unknown
}

class WordDefinition {
  final String wordText;

  final WordType type;

  final String description;

  WordDefinition(this.wordText, this.type, this.description);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WordDefinition &&
          runtimeType == other.runtimeType &&
          wordText == other.wordText &&
          type == other.type &&
          description == other.description;

  @override
  int get hashCode => wordText.hashCode ^ type.hashCode ^ description.hashCode;

  @override
  String toString() {
    return 'WordDefinition<$wordText>{type: ${type.name}, description: $description}';
  }
}

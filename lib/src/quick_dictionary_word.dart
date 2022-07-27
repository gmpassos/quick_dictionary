import 'quick_dictionary_sound.dart';

class QuickDictionary {
  final Language language;

  final QuickDictionarySource source;

  QuickDictionary(this.language, this.source);
}

class Language {
  final String name;

  final String code;

  final SoundCodec soundCodec;

  Language(this.name, this.code, this.soundCodec);
}

class Word {
  final Language language;

  final String word;

  final List<Sound> sounds;

  final List<WordDefinition> definitions;

  Word(this.language, this.word, this.sounds, this.definitions);
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
  final WordType type;

  final String description;

  WordDefinition(this.type, this.description);
}

abstract class QuickDictionarySource {
  Word? findByWord(String word);

  Word? findBySounds(List<Sound> sounds);
}

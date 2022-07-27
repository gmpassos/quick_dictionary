import 'package:collection/collection.dart';

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

abstract class SoundCodec {
  List<Sound> encode(String word);

  String decode(List<Sound> sounds);
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

class Sound {
  final String phonetic ;

  Sound(this.phonetic);
}

abstract class QuickDictionarySource {
  Word? findByWord(String word);

  Word? findBySounds(List<Sound> sounds);
}

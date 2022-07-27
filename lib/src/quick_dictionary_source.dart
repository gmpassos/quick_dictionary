import 'quick_dictionary_sound.dart';

import 'quick_dictionary_word.dart';

class Language {
  final String name;

  final String code;

  final SoundCodec soundCodec;

  Language(this.name, this.code, this.soundCodec);
}

class QuickDictionary {
  final Language language;

  final QuickDictionarySource source;

  QuickDictionary(this.language, this.source);
}

abstract class QuickDictionarySource {
  Word? findByWord(String word);

  Word? findBySounds(List<Sound> sounds);
}

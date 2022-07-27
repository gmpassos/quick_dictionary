import 'quick_dictionary_sound.dart';
import 'quick_dictionary_source.dart';

class Language {
  final String name;

  final String code;

  final SoundCodec soundCodec;

  Language(this.name, this.code, this.soundCodec);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Language &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          code == other.code;

  @override
  int get hashCode => name.hashCode ^ code.hashCode;

  @override
  String toString() {
    return 'Language{name: $name, code: $code, soundCodec: $soundCodec}';
  }
}

class QuickDictionary {
  final Language language;

  final QuickDictionarySource source;

  QuickDictionary(this.language, this.source);
}

import 'quick_dictionary_base.dart';
import 'quick_dictionary_sound.dart';
import 'quick_dictionary_word.dart';

abstract class QuickDictionarySource {
  Word? findByWordText(String wordText);

  Word? findByWordTextSounds(String wordText);

  Word? findBySounds(List<Sound> sounds);

  Iterable<String> get wordsTexts;
}

abstract class QuickDictionaryStorage {
  void addWordDefinition(WordDefinition wordDefinition);
}

abstract class QuickDictionaryDataBase
    implements QuickDictionarySource, QuickDictionaryStorage {}

class QuickDictionaryDataBaseMemory extends QuickDictionaryDataBase {
  final Language language;

  QuickDictionaryDataBaseMemory(this.language);

  final Map<String, Word> wordsByText = <String, Word>{};
  final Map<String, Word> wordsBySounds = <String, Word>{};

  @override
  Iterable<String> get wordsTexts => wordsByText.keys;

  @override
  bool addWordDefinition(WordDefinition definition) {
    var wordText = definition.wordText;
    var word = wordsByText[wordText];

    if (word == null) {
      var sounds = language.soundCodec.encode(wordText);
      word = Word(language, wordText, sounds, <WordDefinition>[definition]);
      wordsByText[wordText] = word;

      var soundsStr = sounds.join('_');
      wordsBySounds[soundsStr] = word;

      return true;
    } else {
      return word.addDefinition(definition);
    }
  }

  @override
  Word? findByWordText(String wordText) => wordsByText[wordText];

  @override
  Word? findByWordTextSounds(String wordText) {
    var sounds = language.soundCodec.encode(wordText);
    return findBySounds(sounds);
  }

  @override
  Word? findBySounds(List<Sound> sounds) {
    var soundsStr = sounds.join('_');
    return wordsBySounds[soundsStr];
  }
}

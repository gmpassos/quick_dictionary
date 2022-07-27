import 'package:quick_dictionary/quick_dictionary.dart';
import 'package:test/test.dart';

void main() {
  group('QuickDictionary', () {
    test('basic', () {
      var language = Language('English Intl.', 'en', SoundCodecLatin());

      print('$language\n');

      var dictionaryDB = QuickDictionaryDataBaseMemory(language);

      dictionaryDB.addWordDefinition(WordDefinition('the', WordType.article,
          'used before nouns to refer to particular things or people.'));

      dictionaryDB.addWordDefinition(WordDefinition('cat', WordType.noun,
          'a small animal with fur, four legs, a tail, and claws, usually kept as a pet.'));

      dictionaryDB.addWordDefinition(WordDefinition('caught', WordType.verb,
          'the past tense and past participle of catch verb.'));

      dictionaryDB.addWordDefinition(WordDefinition(
          'orange',
          WordType.adjective,
          'a round sweet fruit that has a thick orange skin and an orange centre.'));

      dictionaryDB.addWordDefinition(WordDefinition('mouse', WordType.noun,
          'a small mammal with short fur, a pointed face, and a long tail.'));

      var wordCat = dictionaryDB.findByWordText('cat');
      expect(wordCat, isNotNull);
      expect(wordCat?.wordText, equals('cat'));

      var wordCatTypo = dictionaryDB.findByWordTextSounds('caatt');
      expect(wordCatTypo, isNotNull);
      expect(wordCatTypo?.wordText, equals('cat'));
    });
  });
}

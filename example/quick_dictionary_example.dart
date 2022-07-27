import 'package:quick_dictionary/quick_dictionary.dart';

void main() {
  var language = Language('English Intl.', 'en', SoundCodecLatin());

  print('$language\n');

  var dictionaryDB = QuickDictionaryDataBaseMemory(language);

  dictionaryDB.addWordDefinition(WordDefinition('the', WordType.article,
      'used before nouns to refer to particular things or people.'));

  dictionaryDB.addWordDefinition(WordDefinition('cat', WordType.noun,
      'a small animal with fur, four legs, a tail, and claws, usually kept as a pet.'));

  dictionaryDB.addWordDefinition(WordDefinition('caught', WordType.verb,
      'the past tense and past participle of catch verb.'));

  dictionaryDB.addWordDefinition(WordDefinition('orange', WordType.adjective,
      'a round sweet fruit that has a thick orange skin and an orange centre.'));

  dictionaryDB.addWordDefinition(WordDefinition('mouse', WordType.noun,
      'a small mammal with short fur, a pointed face, and a long tail.'));

  var wordCat = dictionaryDB.findByWordText('cat');
  _showWord(wordCat);

  var wordCatTypo = dictionaryDB.findByWordTextSounds('caatt');
  _showWord(wordCatTypo);

  print('--------------------------------------------------------------');

  for (var wordText in dictionaryDB.wordsTexts) {
    var word = dictionaryDB.findByWordText(wordText)!;
    _showWord(word);
  }
}

void _showWord(Word? word) {
  if (word == null) return;

  print(word);

  for (var d in word.definitions) {
    print('-- $d');
  }

  print('');
}

/////////////////////////////
// OUTPUT:
/////////////////////////////
// Language{name: English Intl., code: en, soundCodec: SoundCodecLatin{latin}}
//
// Word<cat>{language: en, types: [noun], sounds: ca_t}
// -- WordDefinition<cat>{type: noun, description: a small animal with fur, four legs, a tail, and claws, usually kept as a pet.}
//
// Word<cat>{language: en, types: [noun], sounds: ca_t}
// -- WordDefinition<cat>{type: noun, description: a small animal with fur, four legs, a tail, and claws, usually kept as a pet.}
//
// --------------------------------------------------------------
// Word<the>{language: en, types: [article], sounds: the}
// -- WordDefinition<the>{type: article, description: used before nouns to refer to particular things or people.}
//
// Word<cat>{language: en, types: [noun], sounds: ca_t}
// -- WordDefinition<cat>{type: noun, description: a small animal with fur, four legs, a tail, and claws, usually kept as a pet.}
//
// Word<caught>{language: en, types: [verb], sounds: cau_ght}
// -- WordDefinition<caught>{type: verb, description: the past tense and past participle of catch verb.}
//
// Word<orange>{language: en, types: [adjective], sounds: o_ra_nge}
// -- WordDefinition<orange>{type: adjective, description: a round sweet fruit that has a thick orange skin and an orange centre.}
//
// Word<mouse>{language: en, types: [noun], sounds: mou_se}
// -- WordDefinition<mouse>{type: noun, description: a small mammal with short fur, a pointed face, and a long tail.}
//

# quick_dictionary

[![pub package](https://img.shields.io/pub/v/quick_dictionary.svg?logo=dart&logoColor=00b9fc)](https://pub.dartlang.org/packages/quick_dictionary)
[![Null Safety](https://img.shields.io/badge/null-safety-brightgreen)](https://dart.dev/null-safety)
[![Codecov](https://img.shields.io/codecov/c/github/gmpassos/quick_dictionary)](https://app.codecov.io/gh/gmpassos/quick_dictionary)
[![CI](https://img.shields.io/github/workflow/status/gmpassos/quick_dictionary/Dart%20CI/master?logo=github-actions&logoColor=white)](https://github.com/gmpassos/quick_dictionary/actions)
[![GitHub Tag](https://img.shields.io/github/v/tag/gmpassos/quick_dictionary?logo=git&logoColor=white)](https://github.com/gmpassos/quick_dictionary/releases)
[![New Commits](https://img.shields.io/github/commits-since/gmpassos/quick_dictionary/latest?logo=git&logoColor=white)](https://github.com/gmpassos/quick_dictionary/network)
[![Last Commits](https://img.shields.io/github/last-commit/gmpassos/quick_dictionary?logo=git&logoColor=white)](https://github.com/gmpassos/quick_dictionary/commits/master)
[![Pull Requests](https://img.shields.io/github/issues-pr/gmpassos/quick_dictionary?logo=github&logoColor=white)](https://github.com/gmpassos/quick_dictionary/pulls)
[![Code size](https://img.shields.io/github/languages/code-size/gmpassos/quick_dictionary?logo=github&logoColor=white)](https://github.com/gmpassos/quick_dictionary)
[![License](https://img.shields.io/github/license/gmpassos/quick_dictionary?logo=open-source-initiative&logoColor=green)](https://github.com/gmpassos/quick_dictionary/blob/master/LICENSE)

A simple and easy-to-use dictionary to be embedded anywhere.

## Usage

Here's a simple usage example:

```dart
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

```

Output:

```text
Language{name: English Intl., code: en, soundCodec: SoundCodecLatin{latin}}

Word<cat>{language: en, types: [noun], sounds: ca_t}
-- WordDefinition<cat>{type: noun, description: a small animal with fur, four legs, a tail, and claws, usually kept as a pet.}

Word<cat>{language: en, types: [noun], sounds: ca_t}
-- WordDefinition<cat>{type: noun, description: a small animal with fur, four legs, a tail, and claws, usually kept as a pet.}

--------------------------------------------------------------
Word<the>{language: en, types: [article], sounds: the}
-- WordDefinition<the>{type: article, description: used before nouns to refer to particular things or people.}

Word<cat>{language: en, types: [noun], sounds: ca_t}
-- WordDefinition<cat>{type: noun, description: a small animal with fur, four legs, a tail, and claws, usually kept as a pet.}

Word<caught>{language: en, types: [verb], sounds: cau_ght}
-- WordDefinition<caught>{type: verb, description: the past tense and past participle of catch verb.}

Word<orange>{language: en, types: [adjective], sounds: o_ra_nge}
-- WordDefinition<orange>{type: adjective, description: a round sweet fruit that has a thick orange skin and an orange centre.}

Word<mouse>{language: en, types: [noun], sounds: mou_se}
-- WordDefinition<mouse>{type: noun, description: a small mammal with short fur, a pointed face, and a long tail.}

```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/gmpassos/quick_dictionary/issues

## Author

Graciliano M. Passos: [gmpassos@GitHub][github].

[github]: https://github.com/gmpassos

## License

[Apache License - Version 2.0][apache_license]

[apache_license]: https://www.apache.org/licenses/LICENSE-2.0.txt

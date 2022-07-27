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
  var m = MapHistory<int, String>();

  m[1] = 'a';
  m[2] = 'b';
  m[3] = 'c';

  var ver3 = m.version;

  print('Version: $ver3 >> $m');

  m[2] = 'B';
  m.remove(3);

  var ver5 = m.version;
  print('Version: $ver5 >> $m');

  print('Rollback to version: $ver3');
  m.rollback(ver3);

  print('Version: ${m.version} >> $m');
}
```

Output:

```text
Version: 3 >> {1: a, 2: b, 3: c}
Version: 5 >> {1: a, 2: B}
Rollback to version: 3
Version: 3 >> {1: a, 2: b, 3: c}
```

## See Also

[Dart Map][dart_map] documentation.

[dart_map]: https://api.dart.dev/be/180360/dart-core/Map-class.html

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/gmpassos/quick_dictionary/issues

## Author

Graciliano M. Passos: [gmpassos@GitHub][github].

[github]: https://github.com/gmpassos

## License

[Apache License - Version 2.0][apache_license]

[apache_license]: https://www.apache.org/licenses/LICENSE-2.0.txt

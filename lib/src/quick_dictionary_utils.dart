import 'package:diacritic/diacritic.dart';

class StringUtils {
  static String simplify(String s) {
    s = removeAccents(s);
    s = s.trim();
    s = s.toLowerCase();
    s = removeNonLettersOrDigits(s);
    return s;
  }

  static String removeAccents(String s) => removeDiacritics(s);

  static final RegExp _regExpNonLettersOrDigits = RegExp(r'[^\da-zA-Z]');

  static String removeNonLettersOrDigits(String s) =>
      s.replaceAll(_regExpNonLettersOrDigits, '');

  static String removeRepeatedLetters(String s) {
    var length = s.length;
    if (length == 0) return '';

    var prev = s[0];
    var str = StringBuffer(prev);

    for (var i = 1; i < length; ++i) {
      var prev = s[i - 1];
      var l = s[i];

      if (prev != l) {
        str.write(l);
      }
    }

    return str.toString();
  }
}

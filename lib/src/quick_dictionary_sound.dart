import 'quick_dictionary_utils.dart';

class Sound {
  final String phonetic;

  Sound(this.phonetic);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Sound &&
          runtimeType == other.runtimeType &&
          phonetic == other.phonetic;

  @override
  int get hashCode => phonetic.hashCode;

  @override
  String toString() {
    return phonetic;
  }
}

abstract class SoundCodec {
  final String name;

  SoundCodec(this.name);

  List<Sound> encode(String wordText);

  String decode(List<Sound> sounds);
}

class SoundCodecLatin extends SoundCodec {
  SoundCodecLatin() : super('latin');

  @override
  String decode(List<Sound> sounds) => sounds.join();

  @override
  List<Sound> encode(String wordText) {
    wordText = StringUtils.simplify(wordText);

    var parts = <String>[];

    wordText.splitMapJoin(RegExp(r'([^aeiyou]+)([aeiyou]+)'), onMatch: (m) {
      var s = m[0]!;
      s = StringUtils.removeRepeatedLetters(s);
      if (s.isNotEmpty) {
        parts.add(s);
      }
      return '';
    }, onNonMatch: (s) {
      s = StringUtils.removeRepeatedLetters(s);
      if (s.isNotEmpty) {
        parts.add(s);
      }
      return '';
    });

    var sounds = parts.map((e) => Sound(e)).toList();
    return sounds;
  }

  @override
  String toString() {
    return 'SoundCodecLatin{$name}';
  }
}

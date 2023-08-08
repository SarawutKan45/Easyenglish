import 'dart:convert';

class LessonModel {
  final String image;
  final String meaning;
  final String vocab;
  final String words;
  final String sound;
  LessonModel({
    this.image,
    this.meaning,
    this.vocab,
    this.words,
    this.sound,
  });

  LessonModel copyWith({
    String image,
    String meaning,
    String vocab,
    String words,
    String sound,
  }) {
    return LessonModel(
      image: image ?? this.image,
      meaning: meaning ?? this.meaning,
      vocab: vocab ?? this.vocab,
      words: words ?? this.words,
      sound: sound ?? this.sound,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'meaning': meaning,
      'vocab': vocab,
      'words': words,
      'sound': sound,
    };
  }

  factory LessonModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return LessonModel(
      image: map['image'],
      meaning: map['meaning'],
      vocab: map['vocab'],
      words: map['words'],
      sound: map['sound'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LessonModel.fromJson(String source) => LessonModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'LessonModel(image: $image, meaning: $meaning, vocab: $vocab, words: $words, sound: $sound)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is LessonModel &&
        o.image == image &&
        o.meaning == meaning &&
        o.vocab == vocab &&
        o.words == words &&
        o.sound == sound;
  }

  @override
  int get hashCode {
    return image.hashCode ^
    meaning.hashCode ^
    vocab.hashCode ^
    words.hashCode ^
    sound.hashCode;
  }
}

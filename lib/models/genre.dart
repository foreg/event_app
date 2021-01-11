import 'package:json_annotation/json_annotation.dart';

enum Genre {
  @JsonValue('фолк')
  folk,
  @JsonValue('кантри')
  country,
  @JsonValue('латиноамериканская')
  latin,
  @JsonValue('блюз')
  blues,
  @JsonValue('джаз')
  jazz,
  @JsonValue('шансон')
  chanson,
  @JsonValue('электро')
  electro,
  @JsonValue('рок')
  rock,
  @JsonValue('хип-хоп')
  hiphop,
  @JsonValue('регги')
  reggae,
  @JsonValue('поп')
  pop,
  @JsonValue('test')
  test,
}

extension GenreExtension on Genre {
  static const _names = {
    Genre.folk: 'фолк',
    Genre.country: 'кантри',
    Genre.latin: 'латиноамериканская',
    Genre.blues: 'блюз',
    Genre.jazz: 'джаз',
    Genre.chanson: 'шансон',
    Genre.electro: 'электро',
    Genre.rock: 'рок',
    Genre.hiphop: 'хип-хоп',
    Genre.reggae: 'регги',
    Genre.pop: 'поп',
    Genre.test: 'test',
  };

  String get name => _names[this];
}

import 'dart:math';

import 'package:gmc/config.dart';
import 'package:gmc/dataset/adjectives.dart';
import 'package:gmc/dataset/nouns.dart';
import 'package:gmc/dataset/plurals.dart';
import 'package:gmc/dataset/quotes.dart';
import 'package:gmc/dataset/superlatives.dart';
import 'package:gmc/dataset/verbs.dart';

String generateQuote() {
  // Randomly pick quotes template
  String quoteTemplate = QuotesExt.getRandomQuote().sentence;

  // Get current settings
  bool filter = settings.getFilter();
  bool arePositive = settings.getArePositive();
  bool filterControversial = settings.getFilterControversial();

  // Randomly pick unique words
  List<dynamic> words = List.empty();
  words += getRandomUnique(Adjectives.values,'>a'.allMatches(quoteTemplate).length, filter, arePositive, filterControversial);
  words += getRandomUnique(Nouns.values,'>n'.allMatches(quoteTemplate).length, filter, arePositive, filterControversial);
  words += getRandomUnique(Plurals.values,'>p'.allMatches(quoteTemplate).length, filter, arePositive, filterControversial);
  words += getRandomUnique(Superlatives.values,'>s'.allMatches(quoteTemplate).length, filter, arePositive, filterControversial);
  words += getRandomUnique(Verbs.values,'>v'.allMatches(quoteTemplate).length, filter, arePositive, filterControversial);

  // Replace words in sentences
  for (var word in words) {
    if (word is Adjectives) {
      quoteTemplate = superReplacer(quoteTemplate, word, '>a');
    } else if (word is Nouns) {
      quoteTemplate = superReplacer(quoteTemplate, word, '>n');
    } else if (word is Plurals) {
      quoteTemplate = superReplacer(quoteTemplate, word, '>p');
    } else if (word is Superlatives) {
      quoteTemplate = superReplacer(quoteTemplate, word, '>s');
    } else if (word is Verbs) {
      quoteTemplate = superReplacer(quoteTemplate, word, '>v');
    }
  }

  return quoteTemplate[0].toUpperCase() + quoteTemplate.substring(1);
}


String superReplacer(String quoteTemplate, dynamic word, String toFind) {
  int index = quoteTemplate.indexOf(toFind);
  String toReplace = quoteTemplate.substring(index, index + 4);
  String newWord = bowTheWord(word, toReplace[2]);
  return quoteTemplate.replaceFirst(toReplace, newWord);
}


String bowTheWord(dynamic word, String wordCase) {
    switch (wordCase) {
      case '1':
        return word.c1;
      case '2':
        return word.c2;
      case '3':
        return word.c3;
      case '4':
        return word.c4;
      case '5':
        return word.c5;
      case '6':
        return word.c6;
      case '7':
        return word.c7;
      default:
        return 'CHYBA';
  }
}

List<dynamic> getRandomUnique(List<dynamic> words, int count, bool filter, bool arePositive, bool filterControversial ) {
  if (count == 0) {
    return List.empty();
  }
  List<dynamic> filtered = words;
  if (filter) {
    filtered = filtered.where((word) => word.positive == arePositive).toList();
  }
  if (filterControversial) {
    filtered = filtered.where((word) => word.controversial == false).toList();
  }

  // Randomizing chosen words (function shuffle causes exceptions)
  Random random = Random();
  int index = random.nextInt(filtered.length);
  List<dynamic> chosen = [filtered[index]];
  filtered = filtered.sublist(0, index) + filtered.sublist(index + 1);
  while (chosen.length < count) {
    index = random.nextInt(filtered.length);
    chosen += [filtered[index]];
    filtered = filtered.sublist(0, index) + filtered.sublist(index + 1);
  }

  return chosen;
}
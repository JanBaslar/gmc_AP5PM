import 'dart:math';

import 'package:gmc/config.dart';

String getRandomText() {
  String isOrNot = 'je';
  if (!settings.getFilterControversial()) {
    isOrNot = 'není';
  }

  List<String> texts = [
    'Generování je má vášeň.',
    'Tvoje denní dávka inspirace.',
    'Následující citát ti vyrazí dech.',
    'V každém citátu je zrnko pravdy.',
    'Vytvářím speciální citát přímo pro tebe.',
    'Jsi můj oblíbený uživatel.',
    'Každý člověk je unikátní.',
    'Tenhle citát řekni svým přátelům.',
    'Život má určitě smysl.',
    'Všechna osobní data sbíráme s láskou.',
    'Citátů není nikdy dost.',
    'Zvládnu být pozitivní i negativní.',
    'Vygeneruji až n + 1 citátů.',
    'Nezapomeň pít hodně vody.',
    'Motivace zvyšuje produktivitu.',
    'Lidé jsou úžasní.',
    'Důvěřuj svému lokálnímu generátoru citátů.',
    'Probouzej se a usínej s citátem.',
    'Filtrování kontroverzních citátů $isOrNot zapnuto.',
    'Inspired by InspiroBot™.',
  ];

  return texts[Random().nextInt(texts.length)];
}
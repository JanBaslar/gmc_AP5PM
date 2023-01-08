import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle getRandomFont(double size) {
  const Shadow shadow = Shadow(
    offset: Offset(0, 0),
    blurRadius: 10,
    color: Color.fromRGBO(0, 0, 0, 1),
  );
  const Color white = Colors.white;
  List<TextStyle> styles = [
    GoogleFonts.scada(fontSize: size, color: white, shadows: [shadow]),
    GoogleFonts.lobster(fontSize: size, color: white, shadows: [shadow]),
    GoogleFonts.dancingScript(fontSize: size, color: white, shadows: [shadow]),
    GoogleFonts.comfortaa(fontSize: size, color: white, shadows: [shadow]),
    GoogleFonts.teko(fontSize: size, color: white, shadows: [shadow]),
    GoogleFonts.prostoOne(fontSize: size, color: white, shadows: [shadow]),
    GoogleFonts.bebasNeue(fontSize: size, color: white, shadows: [shadow]),
    GoogleFonts.righteous(fontSize: size, color: white, shadows: [shadow]),
    GoogleFonts.indieFlower(fontSize: size, color: white, shadows: [shadow]),
    GoogleFonts.amaticSc(fontSize: size, color: white, shadows: [shadow]),
    GoogleFonts.courgette(fontSize: size, color: white, shadows: [shadow]),
    GoogleFonts.staatliches(fontSize: size, color: white, shadows: [shadow]),
    GoogleFonts.poiretOne(fontSize: size, color: white, shadows: [shadow]),
    GoogleFonts.specialElite(fontSize: size, color: white, shadows: [shadow]),
    GoogleFonts.luckiestGuy(fontSize: size, color: white, shadows: [shadow]),
    GoogleFonts.berkshireSwash(fontSize: size, color: white, shadows: [shadow]),
    GoogleFonts.audiowide(fontSize: size, color: white, shadows: [shadow]),
    GoogleFonts.charm(fontSize: size, color: white, shadows: [shadow]),
    GoogleFonts.gideonRoman(fontSize: size, color: white, shadows: [shadow]),
    GoogleFonts.glassAntiqua(fontSize: size, color: white, shadows: [shadow]),
    GoogleFonts.novaSlim(fontSize: size, color: white, shadows: [shadow]),
    GoogleFonts.stintUltraCondensed(fontSize: size, color: white, shadows: [shadow]),
    GoogleFonts.croissantOne(fontSize: size, color: white, shadows: [shadow]),
    GoogleFonts.crushed(fontSize: size, color: white, shadows: [shadow]),
    GoogleFonts.zillaSlab(fontSize: size, color: white, shadows: [shadow]),
    GoogleFonts.expletusSans(fontSize: size, color: white, shadows: [shadow]),
    GoogleFonts.mirza(fontSize: size, color: white, shadows: [shadow]),
    GoogleFonts.italianno(fontSize: size, color: white, shadows: [shadow]),
    GoogleFonts.moonDance(fontSize: size, color: white, shadows: [shadow]),
    GoogleFonts.lora(fontSize: size, color: white, shadows: [shadow]),
    GoogleFonts.caveat(fontSize: size, color: white, shadows: [shadow]),
    GoogleFonts.marckScript(fontSize: size, color: white, shadows: [shadow]),
    GoogleFonts.greatVibes(fontSize: size, color: white, shadows: [shadow]),
    GoogleFonts.yellowtail(fontSize: size, color: white, shadows: [shadow]),
    GoogleFonts.farsan(fontSize: size, color: white, shadows: [shadow]),
    GoogleFonts.alegreyaSc(fontSize: size, color: white, shadows: [shadow]),
    GoogleFonts.playball(fontSize: size, color: white, shadows: [shadow]),
    GoogleFonts.sriracha(fontSize: size, color: white, shadows: [shadow]),
    GoogleFonts.forum(fontSize: size, color: white, shadows: [shadow]),
    GoogleFonts.pangolin(fontSize: size, color: white, shadows: [shadow]),
    GoogleFonts.fleurDeLeah(fontSize: size, color: white, shadows: [shadow]),
    GoogleFonts.racingSansOne(fontSize: size, color: white, shadows: [shadow]),
    GoogleFonts.grenze(fontSize: size, color: white, shadows: [shadow]),
    GoogleFonts.akayaTelivigala(fontSize: size, color: white, shadows: [shadow]),
  ];
  return styles[Random().nextInt(styles.length)];
}
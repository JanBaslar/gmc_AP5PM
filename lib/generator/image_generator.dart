import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Image getRandomLocalImage() {
    String localPath = 'assets/images/image${Random().nextInt(10)}.jpg';
    return Image.asset(localPath,
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center);
}


Future<Image> getRandomImage() async {
  http.Response response;
  try {
    response = await http.get(Uri.parse('https://picsum.photos/2160'))
        .timeout(const Duration(seconds: 4));
  } catch (e) {
    await Future.delayed(const Duration(seconds: 2));
    return getRandomLocalImage();
  }

  if (response.statusCode == 200) {
    await Future.delayed(const Duration(seconds: 2));
    return Image.memory(response.bodyBytes,
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center);

  } else {
    await Future.delayed(const Duration(seconds: 2));
    return getRandomLocalImage();
  }
}
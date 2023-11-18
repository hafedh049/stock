import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<Uint8List> getProductPicture(List<List<int>> picture) async {
  try {
    return Uint8List.fromList(picture.first);
  } catch (e) {
    final ByteData data = await rootBundle.load('assets/backup.png');
    return Uint8List.view(data.buffer);
  }
}

List<LinearGradient> generateUniqueGradients() {
  final List<LinearGradient> gradients = <LinearGradient>[];
  final Random random = Random();

  while (gradients.length < 20) {
    final Color color1 = Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );

    final Color color2 = Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );

    final LinearGradient newGradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [color1, color2],
    );

    if (!gradients.contains(newGradient)) {
      gradients.add(newGradient);
    }
  }

  return gradients;
}

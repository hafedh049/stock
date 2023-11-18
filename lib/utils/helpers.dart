import 'package:flutter/services.dart';

Future<Uint8List> getProductPicture(List<List<int>> picture) async {
  try {
    return Uint8List.fromList(picture.first);
  } catch (e) {
    final ByteData data = await rootBundle.load('assets/backup.png');
    return Uint8List.view(data.buffer);
  }
}

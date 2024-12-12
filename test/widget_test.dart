import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:weather_app/main.dart';

void main() {
  testWidgets('Hava durumu ekranı widget testi', (WidgetTester tester) async {
    // Uygulamayı yükle ve bir kare oluştur.
    await tester.pumpWidget(HavaDurumuApp());

    // Şehir adı için metin alanını bul.
    final textField = find.byType(TextField);
    expect(textField, findsOneWidget);

    // Şehir adı gir ve düğmeye tıkla.
    await tester.enterText(textField, 'Ankara');
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump(); // UI güncellenmesini tetikle.

    // Hava durumu sonucunun gösterilip gösterilmediğini kontrol et.
    expect(find.textContaining('°C'), findsOneWidget);
  });
}

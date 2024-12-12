import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(HavaDurumuApp());

class HavaDurumuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hava Durumu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HavaDurumuEkrani(),
    );
  }
}

class HavaDurumuEkrani extends StatefulWidget {
  const HavaDurumuEkrani({super.key});

  @override
  _HavaDurumuEkraniState createState() => _HavaDurumuEkraniState();
}

class _HavaDurumuEkraniState extends State<HavaDurumuEkrani> {
  final TextEditingController _sehirController = TextEditingController();
  String? _havaDurumu;

  Future<void> havaDurumuGetir(String sehir) async {
    const apiKey = 'efa4668ac04e5f6052d61116ef7b8971'; // Sizin API anahtarınız
    final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$sehir&appid=$apiKey&units=metric&lang=tr');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _havaDurumu =
              "${data['main']['temp']}°C, ${data['weather'][0]['description']}"; // Sıcaklık ve açıklama
        });
      } else {
        setState(() {
          _havaDurumu = 'Şehir bulunamadı.';
        });
      }
    } catch (e) {
      setState(() {
        _havaDurumu = 'Hata oluştu: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hava Durumu'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _sehirController,
              decoration: const InputDecoration(
                labelText: 'Şehir Adı',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final sehir = _sehirController.text;
                if (sehir.isNotEmpty) {
                  havaDurumuGetir(sehir);
                }
              },
              child: const Text('Hava Durumunu Getir'),
            ),
            const SizedBox(height: 32),
            if (_havaDurumu != null)
              Text(
                _havaDurumu!,
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
    );
  }
}

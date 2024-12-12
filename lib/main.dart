import 'package:flutter/material.dart';
import 'screens/hava_durumu_ekrani.dart';

void main() => runApp(HavaDurumuApp());

class HavaDurumuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hava Durumu',
      theme: ThemeData(
        primaryColor: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          color: Colors.purple,
          elevation: 8.0,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Hava Durumu',
            style: TextStyle(fontSize: 26.0, color: Colors.white),
          ),
          backgroundColor: Colors.purple,
        ),
        body: HavaDurumuEkrani(),
        backgroundColor: Colors.purple[50],
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Yenileme işlemi
            (context as Element).markNeedsBuild();
          },
          child: Icon(Icons.refresh, color: Colors.white),
          backgroundColor: Colors.purple,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tentang Saya')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          Text(
            'Keahlian dan Hobi',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          ListTile(
            leading: Icon(Icons.code),
            title: Text('Programming'),
            subtitle: Text('Java, PHP, JavaScript'),
          ),
          ListTile(
            leading: Icon(Icons.computer),
            title: Text('Software Engineering'),
            subtitle: Text('Application Development'),
          ),
          ListTile(
            leading: Icon(Icons.sports_esports),
            title: Text('Game Modding'),
            subtitle: Text('Modifikasi aplikasi dan game'),
          ),
          Divider(),
          Text(
            'Riwayat Pendidikan',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          ListTile(
            leading: Icon(Icons.school),
            title: Text('Universitas Global Institute'),
            subtitle: Text('Teknik Informatika'),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final keahlianDanHobi = [
      {
        'icon': Icons.flutter_dash,
        'title': 'Mobile Development (Flutter & Dart)',
        'subtitle': 'Membangun antarmuka aplikasi Android lintas platform',
      },
      {
        'icon': Icons.storage,
        'title': 'Database & REST API',
        'subtitle': 'Pengelolaan data terstruktur dan integrasi backend',
      },
      {
        'icon': Icons.design_services,
        'title': 'UI/UX Design',
        'subtitle': 'Merancang wireframe dan desain aplikasi responsif',
      },
      {
        'icon': Icons.two_wheeler,
        'title': 'Touring & Otomotif',
        'subtitle': 'Hobi eksplorasi rute baru dan perawatan kendaraan',
      },
    ];

    final riwayatPendidikan = [
      {
        'institusi': 'Institut Teknologi & Bisnis Bina Sarana Global',
        'jurusan': 'S1 Teknik Informatika (2024 - Sekarang)',
      },
      {
        'institusi': 'SMA / SMK Negeri',
        'jurusan': 'Jurusan IPA / Rekayasa Perangkat Lunak (2021 - 2024)',
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Tentang Saya')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            'Keahlian & Hobi',
            style: Theme.of(context).textTheme.titleLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ...keahlianDanHobi.map(
            (item) => Card(
              margin: const EdgeInsets.symmetric(vertical: 6),
              child: ListTile(
                leading: Icon(
                  item['icon'] as IconData,
                  color: Theme.of(context).colorScheme.primary,
                ),
                title: Text(item['title'] as String),
                subtitle: Text(item['subtitle'] as String),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Riwayat Pendidikan',
            style: Theme.of(context).textTheme.titleLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ...riwayatPendidikan.map(
            (edu) => Card(
              margin: const EdgeInsets.symmetric(vertical: 6),
              child: ListTile(
                leading: const Icon(Icons.school),
                title: Text(edu['institusi']!),
                subtitle: Text(edu['jurusan']!),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

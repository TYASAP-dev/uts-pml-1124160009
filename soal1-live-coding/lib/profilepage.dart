import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                  child: Icon(Icons.person, size: 50),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Muhammad Aditya Saputra',
                  style: TextStyle(fontSize: 22),
                ),
                const Text('1124160009'),
                const Text('Teknik Informatika'),
                const SizedBox(height: 20),
                const Card(
                  child: Column(
                    children: [
                      Text('Informasi Kontak'),
                      InfoTile(
                        icon: Icons.email,
                        label: 'Email',
                        value: 'adityaproduction011@gmail.com',
                      ),
                      InfoTile(
                        icon: Icons.phone,
                        label: 'HP',
                        value: '088295690424',
                      ),
                      InfoTile(
                        icon: Icons.school,
                        label: 'Kelas',
                        value: 'Teknik Informatika',
                      ),
                      InfoTile(
                        icon: Icons.code,
                        label: 'GitHub',
                        value: 'github.com/TYASAP-dev',
                      ),
                      const SizedBox(height: 15),
                      const Card(
                        child: Column(
                          children: [
                            Text('Keahlian dan Hobi'),
                            InfoTile(
                              icon: Icons.code,
                              label: 'Keahlian',
                              value: 'Programming',
                            ),
                            InfoTile(
                              icon: Icons.computer,
                              label: 'Software',
                              value: 'Software Engineering',
                            ),
                            InfoTile(
                              icon: Icons.sports_esports,
                              label: 'Hobi',
                              value: 'Coding dan Gaming',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Terima kasih telah melihat profil saya'),
            ),
          );
        },
        child: const Icon(Icons.favorite),
      ),
    );
  }
}

class InfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const InfoTile({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(label),
      subtitle: Text(value),
    );
  }
}

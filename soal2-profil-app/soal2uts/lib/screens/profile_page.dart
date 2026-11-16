import 'package:flutter/material.dart';

import '../models/profile.dart';
import 'edit_profile_page.dart';
import 'about_page.dart';
import '../widgets/info_tile.dart';

class ProfilePage extends StatefulWidget {
  final Function(ThemeMode) onThemeChanged;

  const ProfilePage({super.key, required this.onThemeChanged});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Profile profile = Profile(
    nama: 'Muhammad Aditya Saputra',
    nim: '1124160009',
    prodi: 'Teknik Informatika',
    kelas: 'TI Semester 5',
    bio: 'Mahasiswa Software Engineering yang menyukai programming.',
    email: 'adityaproduction011@gmail.com',
    hp: '088295690424',
    github: 'github.com/TYASAP-dev',
  );

  Future<void> editProfile() async {
    final result = await Navigator.push<Profile>(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfilePage(profile: profile),
      ),
    );

    if (result != null) {
      setState(() {
        profile = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        actions: [
          IconButton(onPressed: editProfile, icon: const Icon(Icons.edit)),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(child: Text('Menu Profil')),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profil'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Tentang Saya'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutPage()),
                );
              },
            ),
            const Divider(),
            SwitchListTile(
              secondary: const Icon(Icons.dark_mode),
              title: const Text('Mode Gelap'),
              value: Theme.of(context).brightness == Brightness.dark,
              onChanged: (value) {
                widget.onThemeChanged(value ? ThemeMode.dark : ThemeMode.light);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 65,
              backgroundImage: AssetImage('assets/images/profile.jpg'),
            ),
            const SizedBox(height: 15),
            Text(
              profile.nama,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            Text('NIM: ${profile.nim}'),
            Text(profile.prodi),
            Text(profile.kelas),
            const SizedBox(height: 10),
            Text(profile.bio, textAlign: TextAlign.center),
            const SizedBox(height: 20),
            Card(
              child: Column(
                children: [
                  const ListTile(title: Text('Informasi Kontak')),
                  InfoTile(
                    icon: Icons.email,
                    label: 'Email',
                    value: profile.email,
                  ),
                  InfoTile(
                    icon: Icons.phone,
                    label: 'Nomor HP',
                    value: profile.hp,
                  ),
                  InfoTile(
                    icon: Icons.code,
                    label: 'GitHub',
                    value: profile.github,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: editProfile,
                icon: const Icon(Icons.edit),
                label: const Text('Edit Profil'),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Tentang'),
        ],
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AboutPage()),
            );
          }
        },
      ),
    );
  }
}

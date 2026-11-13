import 'package:flutter/material.dart';

import '../models/profile.dart';
import '../widgets/info_tile.dart';

class ProfilePage extends StatefulWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;

  const ProfilePage({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 0;

  Profile _profile = const Profile(
    nama: 'Nama Lengkap Kamu',
    nim: '2401010123',
    prodi: 'Teknik Informatika',
    kelas: 'TI-24-Malam',
    bio: 'Mahasiswa Teknik Informatika yang antusias mengembangkan aplikasi mobile menggunakan Flutter.',
    email: 'mahasiswa@global.ac.id',
    hp: '081234567890',
    github: 'github.com/username-kamu',
  );

  Future<void> _navigateToEdit() async {
    final updatedProfile = await Navigator.pushNamed(
      context,
      '/edit-profile',
      arguments: _profile,
    );

    if (updatedProfile != null && updatedProfile is Profile) {
      setState(() {
        _profile = updatedProfile;
      });
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profil berhasil diperbarui')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Mahasiswa'),
        actions: [
          IconButton(
            icon: Icon(widget.isDarkMode ? Icons.light_mode : Icons.dark_mode),
            tooltip: 'Ganti Tema',
            onPressed: () => widget.onThemeChanged(!widget.isDarkMode),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(_profile.nama),
              accountEmail: Text(_profile.email),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile.jpg'),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profil Saya'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Edit Profil'),
              onTap: () {
                Navigator.pop(context);
                _navigateToEdit();
              },
            ),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('Tentang Saya'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/about');
              },
            ),
            const Divider(),
            SwitchListTile(
              secondary: const Icon(Icons.brightness_6),
              title: const Text('Mode Gelap'),
              value: widget.isDarkMode,
              onChanged: widget.onThemeChanged,
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Keluar', style: TextStyle(color: Colors.red)),
              onTap: () => Navigator.pushReplacementNamed(context, '/login'),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 56,
                backgroundImage: AssetImage('assets/images/profile.jpg'),
              ),
              const SizedBox(height: 16),
              Text(
                _profile.nama,
                style: Theme.of(context).textTheme.headlineSmall
                    ?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                '${_profile.nim} • ${_profile.prodi}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                'Kelas: ${_profile.kelas}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 12),
              Text(
                _profile.bio,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 20),
              InfoTile(
                icon: Icons.email,
                label: 'Email',
                value: _profile.email,
              ),
              InfoTile(
                icon: Icons.phone_android,
                label: 'Nomor HP',
                value: _profile.hp,
              ),
              InfoTile(
                icon: Icons.code,
                label: 'GitHub',
                value: _profile.github,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _navigateToEdit,
        icon: const Icon(Icons.edit),
        label: const Text('Edit Profil'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() => _selectedIndex = index);
          if (index == 1) {
            Navigator.pushNamed(context, '/about').then((_) {
              setState(() => _selectedIndex = 0);
            });
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Tentang Saya',
          ),
        ],
      ),
    );
  }
}

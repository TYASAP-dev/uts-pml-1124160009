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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

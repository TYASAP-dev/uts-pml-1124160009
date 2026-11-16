import 'package:flutter/material.dart';

import '../models/profile.dart';

class EditProfilePage extends StatefulWidget {
  final Profile profile;

  const EditProfilePage({super.key, required this.profile});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController nama;
  late TextEditingController email;
  late TextEditingController hp;

  @override
  void initState() {
    super.initState();
    nama = TextEditingController(text: widget.profile.nama);
    email = TextEditingController(text: widget.profile.email);
    hp = TextEditingController(text: widget.profile.hp);
  }

  @override
  void dispose() {
    nama.dispose();
    email.dispose();
    hp.dispose();
    super.dispose();
  }

  void simpan() {
    if (!_formKey.currentState!.validate()) return;

    final dataBaru = Profile(
      nama: nama.text,
      nim: widget.profile.nim,
      prodi: widget.profile.prodi,
      kelas: widget.profile.kelas,
      bio: widget.profile.bio,
      email: email.text,
      hp: hp.text,
      github: widget.profile.github,
    );

    Navigator.pop(context, dataBaru);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profil')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nama,
                decoration: const InputDecoration(labelText: 'Nama Lengkap'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama wajib diisi';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: email,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null ||
                      !RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(value)) {
                    return 'Email tidak valid';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: hp,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Nomor HP'),
                validator: (value) {
                  if (value == null ||
                      !RegExp(r'^[0-9]{10,13}$').hasMatch(value)) {
                    return 'Nomor HP harus 10-13 angka';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 25),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: simpan,
                  child: const Text('SIMPAN'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

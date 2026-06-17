import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final avatarRadius = (width * 0.12).clamp(40.0, 80.0);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Toko NTT'),
        backgroundColor: Colors.deepOrange,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              CircleAvatar(
                radius: avatarRadius,
                backgroundColor: Colors.deepOrange.shade100,
                child: Icon(Icons.storefront, size: avatarRadius, color: Colors.deepOrange),
              ),
              const SizedBox(height: 16),
              const Text(
                'Warung Rasa NTT',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Menjual makanan khas NTT asli dengan bahan lokal dan resep turun-temurun. Kami menjamin rasa tradisional dan pelayanan ramah untuk setiap pelanggan.',
                style: TextStyle(fontSize: 15, height: 1.5),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              const ListTile(
                leading: Icon(Icons.location_on, color: Colors.deepOrange),
                title: Text('Lokasi'),
                subtitle: Text('Jalan Melasti 12, Kupang, NTT'),
              ),
              const ListTile(
                leading: Icon(Icons.phone, color: Colors.deepOrange),
                title: Text('Telepon'),
                subtitle: Text('+62 812 3456 7890'),
              ),
              const ListTile(
                leading: Icon(Icons.access_time, color: Colors.deepOrange),
                title: Text('Jam Buka'),
                subtitle: Text('08.00 - 20.00 WIB'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

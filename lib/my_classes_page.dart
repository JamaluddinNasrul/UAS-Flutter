import 'package:flutter/material.dart';
import 'package:dimmah/notifications_page.dart';

class MyClassesPage extends StatelessWidget {
  const MyClassesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Kelas Saya',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey[200],
            height: 4.0,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildClassItem(
            imageUrl: 'https://via.placeholder.com/80/FFC107/FFFFFF?text=UI/UX',
            year: '2021/2',
            title: 'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA D4SM-42-03 [ADY]',
            progress: 0.88,
            progressText: '88% Selesai',
          ),
          const SizedBox(height: 25),
          _buildClassItem(
            imageUrl: 'https://via.placeholder.com/80/B31B1B/FFFFFF?text=Pkn',
            year: '2021/2',
            title: 'KEWARGANEGARAAN D4SM-41-GAB1 [BBD], JUMAT 2',
            progress: 0.85,
            progressText: '85% Selesai',
          ),
          const SizedBox(height: 25),
          _buildClassItem(
            imageUrl: 'https://via.placeholder.com/80/FFFFFF/000000?text=OS',
            year: '2021/2',
            title: 'SISTEM OPERASI D4SM-44-02 [DOS]',
            progress: 0.80,
            progressText: '80% Selesai',
          ),
          const SizedBox(height: 25),
          _buildClassItem(
            imageUrl: 'https://via.placeholder.com/80/4DD0E1/FFFFFF?text=Mobile',
            year: '2021/2',
            title: 'PEMROGRAMAN PERANGKAT BERGERAK MULTIMEDIA D4SM-41-GAB1 [APJ]',
            progress: 0.80,
            progressText: '80% Selesai',
          ),
          const SizedBox(height: 100), // Space for bottom nav
        ],
      ),
      bottomNavigationBar: Container(
        height: 70,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xFFC25151),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(Icons.home_outlined, 'Home', false, context),
            _buildNavItem(Icons.school_outlined, 'Kelas Saya', true, context),
            _buildNavItem(Icons.notifications_outlined, 'Notifikasi', false, context),
          ],
        ),
      ),
    );
  }

  Widget _buildClassItem({
    required String imageUrl,
    required String year,
    required String title,
    required double progress,
    required String progressText,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 90,
          height: 90,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(4),
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                year,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 11,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 15),
              Container(
                height: 8,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(4),
                ),
                child: FractionallySizedBox(
                  widthFactor: progress,
                  alignment: Alignment.centerLeft,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFB31B1B),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                progressText,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isActive, BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!isActive) {
          if (label == 'Home') {
            Navigator.pop(context);
          } else if (label == 'Notifikasi') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const NotificationsPage()),
            );
          }
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 28,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:dimmah/my_classes_page.dart';
import 'package:dimmah/notifications_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int activeTab = 0; // 0 for About Me, 1 for Kelas, 2 for Edit Profile

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Dark Red Header Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 50, bottom: 40),
              decoration: const BoxDecoration(
                color: Color(0xFFB33A3A),
              ),
              child: Column(
                children: [
                  // Back Button Row
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ),
                  // Profile Image
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                      image: const DecorationImage(
                        image: NetworkImage('https://via.placeholder.com/120?text=Profile'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'DANDY CANDRA PRATAMA',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
            ),

            // Overlapping Tab Bar
            Transform.translate(
              offset: const Offset(0, -30),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                padding: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildTabItem(0, 'About Me'),
                    _buildTabItem(1, 'Kelas'),
                    _buildTabItem(2, 'Edit Profile'),
                  ],
                ),
              ),
            ),

            // Content Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: activeTab == 0
                  ? _buildAboutMeContent()
                  : activeTab == 1
                      ? _buildKelasContent()
                      : _buildEditProfileContent(),
            ),
          ],
        ),
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
            _buildNavItem(Icons.home_outlined, 'Home', false),
            _buildNavItem(Icons.school_outlined, 'Kelas Saya', false),
            _buildNavItem(Icons.notifications_outlined, 'Notifikasi', false),
          ],
        ),
      ),
    );
  }

  Widget _buildAboutMeContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Informasi User',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        _buildProfileField('Email address', 'dandycandra@365.telkomuniversity.ac.id'),
        _buildProfileField('Program Studi', 'D4 Teknologi Rekayasa Multimedia'),
        _buildProfileField('Fakultas', 'FIT'),
        const SizedBox(height: 30),
        const Text(
          'Aktivitas Login',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        _buildProfileField('First access to site', 'Monday, 7 September 2020, 9:27 AM  (288 days 12 hours)'),
        _buildProfileField('Last access to site', 'Tuesday, 22 June 2021, 9:44 PM  (now)'),
        const SizedBox(height: 100),
      ],
    );
  }

  Widget _buildKelasContent() {
    return Column(
      children: [
        _buildCourseHistoryItem(
          'BAHASA INGGRIS: BUSINESS AND SCIENTIFIC D4SM-41-GAB1 [ARS]',
          'Tanggal Mulai: Monday, 8 February 2021',
        ),
        _buildCourseHistoryItem(
          'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA D4SM-42-03 [ADY]',
          'Tanggal Mulai: Monday, 8 February 2021',
        ),
        _buildCourseHistoryItem(
          'KEWARGANEGARAAN D4SM-41-GAB1 [BBD], JUMAT 2',
          'Tanggal Mulai: Monday, 8 February 2021',
        ),
        _buildCourseHistoryItem(
          'OLAH RAGA D3TT-44-02 [EYR]',
          'Tanggal Mulai: Monday, 8 February 2021',
        ),
        _buildCourseHistoryItem(
          'PEMROGRAMAN MULTIMEDIA INTERAKTIF D4SM-43-01 [TPR]',
          'Tanggal Mulai: Monday, 8 February 2021',
        ),
        _buildCourseHistoryItem(
          'PEMROGRAMAN PERANGKAT BERGERAK MULTIMEDIA D4SM-41-GAB1 [APJ]',
          'Tanggal Mulai: Monday, 8 February 2021',
        ),
        const SizedBox(height: 100),
      ],
    );
  }

  Widget _buildEditProfileContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildEditField('Nama Pertama'),
        _buildEditField('Nama Terakhir'),
        _buildEditField('E-mail Address'),
        _buildEditField('Negara'),
        _buildEditField('Deskripsi', isMultiLine: true),
        const SizedBox(height: 20),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              'Simpan',
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        const SizedBox(height: 100),
      ],
    );
  }

  Widget _buildEditField(String label, {bool isMultiLine = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            height: isMultiLine ? 120 : 45,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]!),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextField(
              maxLines: isMultiLine ? 5 : 1,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCourseHistoryItem(String title, String date) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 70,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFF86B7DA),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem(int index, String label) {
    bool isActive = activeTab == index;
    return GestureDetector(
      onTap: () => setState(() => activeTab = index),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 13,
                color: isActive ? Colors.black87 : Colors.grey,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
          if (isActive)
            Container(
              width: 40,
              height: 2.5,
              decoration: BoxDecoration(
                color: Colors.grey[600],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildProfileField(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.black54,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, bool isActive) {
    return GestureDetector(
      onTap: () {
        if (label == 'Home') {
          Navigator.of(context).popUntil((route) => route.isFirst);
        } else if (label == 'Kelas Saya') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const MyClassesPage()),
          );
        } else if (label == 'Notifikasi') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const NotificationsPage()),
          );
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

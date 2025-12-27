import 'package:flutter/material.dart';
import 'package:dimmah/notifications_page.dart';

class CourseDetailPage extends StatefulWidget {
  final String courseTitle;

  const CourseDetailPage({super.key, required this.courseTitle});

  @override
  State<CourseDetailPage> createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends State<CourseDetailPage> {
  int activeTab = 0; // 0 for Materi, 1 for Tugas Dan Kuis

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F8),
      body: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.only(top: 50, left: 10, right: 20, bottom: 20),
            color: const Color(0xFFB33A3A),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Text(
                    widget.courseTitle,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Custom Tabs
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Row(
              children: [
                _buildTabItem(0, 'Materi'),
                _buildTabItem(1, 'Tugas Dan Kuis'),
              ],
            ),
          ),

          // Course Content List
          Expanded(
            child: activeTab == 0 
              ? _buildMateriList() 
              : _buildTugasKuisList(),
          ),
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
            _buildNavItem(Icons.home_outlined, 'Home', false),
            _buildNavItem(Icons.school_outlined, 'Kelas Saya', true),
            _buildNavItem(Icons.notifications_outlined, 'Notifikasi', false),
          ],
        ),
      ),
    );
  }

  Widget _buildMateriList() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        _buildMeetingCard(
          meetingNumber: 'Pertemuan 1',
          title: '01 - Pengantar User Interface Design',
          stats: '3 URLs, 2 files, 3 Interactive Content',
          isCompleted: false,
        ),
        const SizedBox(height: 15),
        _buildMeetingCard(
          meetingNumber: 'Pertemuan 2',
          title: '02 - Konsep User Interface Design',
          stats: '2 URLs, 1 kuis, 3 files, 1 Tugas',
          isCompleted: true,
        ),
        const SizedBox(height: 15),
        _buildMeetingCard(
          meetingNumber: 'Pertemuan 3',
          title: '03 - Interaksi pada User Interface Design',
          stats: '3 URLs, 2 files, 3 Interactive Content',
          isCompleted: true,
        ),
        const SizedBox(height: 15),
        _buildMeetingCard(
          meetingNumber: 'Pertemuan 4',
          title: '04 - Ethnographic Observation',
          stats: '3 URLs, 2 files, 3 Interactive Content',
          isCompleted: true,
        ),
        const SizedBox(height: 100),
      ],
    );
  }

  Widget _buildTugasKuisList() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        _buildAssessmentCard(
          type: 'QUIZ',
          title: 'Quiz Review 01',
          deadline: 'Tenggat Waktu : 26 Februari 2021 23:59 WIB',
          isCompleted: true,
          icon: Icons.quiz_outlined,
        ),
        const SizedBox(height: 15),
        _buildAssessmentCard(
          type: 'Tugas',
          title: 'Tugas 01 - UID Android Mobile Game',
          deadline: 'Tenggat Waktu : 26 Februari 2021 23:59 WIB',
          isCompleted: false,
          icon: Icons.assignment_outlined,
        ),
        const SizedBox(height: 15),
        _buildAssessmentCard(
          type: 'Pertemuan 3',
          title: 'Kuis - Assessment 2',
          deadline: 'Tenggat Waktu : 26 Februari 2021 23:59 WIB',
          isCompleted: true,
          icon: Icons.quiz_outlined,
        ),
        const SizedBox(height: 100),
      ],
    );
  }

  Widget _buildAssessmentCard({
    required String type,
    required String title,
    required String deadline,
    required bool isCompleted,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFF5AB4E5),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  type,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Icon(
                Icons.check_circle,
                color: isCompleted ? Colors.green : Colors.grey[300],
                size: 22,
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Icon(icon, size: 40, color: Colors.black87),
              const SizedBox(width: 15),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            deadline,
            style: TextStyle(
              color: Colors.grey[400],
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem(int index, String label) {
    bool isActive = activeTab == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => activeTab = index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: isActive ? Colors.black : Colors.grey,
                  fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                  fontSize: 14,
                ),
              ),
              if (isActive)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Container(
                    width: 30,
                    height: 2,
                    color: Colors.black,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMeetingCard({
    required String meetingNumber,
    required String title,
    required String stats,
    required bool isCompleted,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFF5AB4E5),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  meetingNumber,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Icon(
                Icons.check_circle,
                color: isCompleted ? Colors.green : Colors.grey[300],
                size: 22,
              ),
            ],
          ),
          const SizedBox(height: 15),
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            stats,
            style: TextStyle(
              color: Colors.grey[400],
              fontSize: 12,
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
        } else if (label == 'Kelas Saya' && !isActive) {
          Navigator.pop(context);
        } else if (label == 'Notifikasi') {
          Navigator.push(
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

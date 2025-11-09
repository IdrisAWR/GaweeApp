// lib/profile_screen.dart
import 'package:flutter/material.dart';
import 'package:coba_1/shared_widgets/app_drawer.dart'; // Impor AppDrawer Anda

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Key untuk mengontrol Scaffold (agar tombol '...' bisa buka drawer)
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;
    final Color titleColor = Theme.of(context).textTheme.bodyLarge!.color!;
    final Color subtitleColor = Theme.of(context).hintColor;

    return Scaffold(
      key: _scaffoldKey,
      drawer: const AppDrawer(), // Hubungkan drawer
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: titleColor),
          onPressed: () => Navigator.of(context).pop(), // Tombol kembali
        ),
        title: Text(
          "Profile",
          style: TextStyle(color: titleColor, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: subtitleColor),
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer(); // Buka drawer
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // Pusatkan semua
          children: [
            // --- Foto Profil ---
            const CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('assets/images/3.jpg'), // Ganti dengan aset Anda
            ),
            const SizedBox(height: 15),

            // --- Nama & Judul ---
            Text(
              "Richard Brownlee",
              style: TextStyle(
                color: titleColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "Engineer",
              style: TextStyle(color: subtitleColor, fontSize: 16),
            ),
            const SizedBox(height: 20),

            // --- Bio ---
            Text(
              "Duis aute irure cillum dolore in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident",
              textAlign: TextAlign.center,
              style: TextStyle(color: subtitleColor, fontSize: 15, height: 1.5),
            ),
            const SizedBox(height: 30),

            // --- Tombol My Resume ---
            _buildResumeButton(context, primaryColor),
            const SizedBox(height: 30),

            // --- Judul Skills ---
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Skills",
                style: TextStyle(
                  color: titleColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // --- Daftar Skills ---
            _buildSkillBar(
              context,
              "Problem Solving",
              70, // Persentase
            ),
            _buildSkillBar(
              context,
              "Drawing",
              35,
            ),
            _buildSkillBar(
              context,
              "Illustration",
              80,
            ),
            _buildSkillBar(
              context,
              "Photoshop",
              34,
            ),
          ],
        ),
      ),
    );
  }

  // Widget helper untuk tombol resume
  Widget _buildResumeButton(BuildContext context, Color primaryColor) {
    return GestureDetector(
      onTap: () {
        // TODO: Tambahkan logika untuk membuka resume
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "My Resume",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  "david_resume.pdf",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
            const Icon(
              Icons.file_upload_outlined, // Ikon panah atas (upload)
              color: Colors.white,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }

  // Widget helper untuk satu skill bar
  Widget _buildSkillBar(BuildContext context, String skillName, int percentage) {
    final Color primaryColor = Theme.of(context).primaryColor;
    final Color titleColor = Theme.of(context).textTheme.bodyLarge!.color!;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Teks (Nama skill dan persentase)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                skillName,
                style: TextStyle(
                  color: titleColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "$percentage%",
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          
          // Progress bar
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: percentage / 100.0, // Nilai antara 0.0 dan 1.0
              minHeight: 8,
              backgroundColor: Colors.grey.shade200,
              color: primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
// lib/login_screen.dart
import 'package:flutter/material.dart';
import 'package:coba_1/shared_widgets/custom_form_field.dart';        // Impor widget kustom
import 'forgot_password_screen.dart';   // Impor halaman lupa password
import 'create_account_screen.dart';    // Impor halaman registrasi
import 'package:coba_1/features/home/home_screen.dart';     // Impor placeholder home

class LoginScreen extends StatefulWidget {
  final int initialTabIndex; // 0 untuk Job Seeker, 1 untuk Company

  const LoginScreen({Key? key, this.initialTabIndex = 0}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  Color primaryColor = const Color(0xFF9634FF);
  Color secondaryColor = const Color(0xFF569AFF);
  Color backgroundColor = const Color(0xFFF9F7FF);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: widget.initialTabIndex,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // 1. Logo Gawee di atas
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/gawee.png', // Logo dengan teks
                    width: 200,
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ),
            
            // 2. TabBar (Job Seeker & Company)
            TabBar(
              controller: _tabController,
              labelColor: primaryColor,
              unselectedLabelColor: Colors.grey,
              indicatorColor: primaryColor,
              indicatorWeight: 3.0,
              labelStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              tabs: const [
                Tab(text: "JOB SEEKER"),
                Tab(text: "COMPANY"),
              ],
            ),
            
            // 3. Konten Tab
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildJobSeekerTab(context), // Tampilan Gambar 4
                  _buildCompanyTab(context),   // Tampilan Gambar 5
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- Widget untuk TAB JOB SEEKER (Gambar 4) ---
  Widget _buildJobSeekerTab(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 10),
          const Text(
            "Sign in to your registered account",
            style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(height: 20),
          const CustomFormField(hintText: "User Name"),
          const SizedBox(height: 20),
          const CustomFormField(hintText: "Password", obscureText: true),
          const SizedBox(height: 30),
          _buildLoginButton(
            "LOGIN",
            primaryColor,
            () => Navigator.pushReplacement( // Ganti tujuannya
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()),
            ),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: const TextStyle(fontSize: 15, color: Colors.black54),
                children: [
                  const TextSpan(text: "Forgot your password? "),
                  TextSpan(
                    text: "Reset here",
                    style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
          const Center(child: Text("Or sign in with", style: TextStyle(color: Colors.grey))),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSocialButton('assets/images/google.png', () {}),
              const SizedBox(width: 20),
              _buildSocialButton('assets/images/facebook.png', () {}),
            ],
          ),
          const SizedBox(height: 30),
          OutlinedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CreateAccountScreen()),
            ),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              side: BorderSide(color: primaryColor, width: 2),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            child: Text(
              "CREATE ACCOUNT",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- Widget untuk TAB COMPANY (Gambar 5) ---
  Widget _buildCompanyTab(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 10),
          const Text(
            "Company account",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold,color: Colors.black),
          ),
          const SizedBox(height: 20),
          const CustomFormField(hintText: "Company Id"),
          const SizedBox(height: 20),
          const CustomFormField(hintText: "User Name"),
          const SizedBox(height: 20),
          const CustomFormField(hintText: "Password", obscureText: true),
          const SizedBox(height: 30),
          _buildLoginButton(
            "LOGIN",
            primaryColor,
            () => Navigator.pushReplacement( // Ganti tujuannya
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            ),
          ),
        ],
      ),
    );
  }

  // --- Widget Bantuan ---
  Widget _buildLoginButton(String text, Color color, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildSocialButton(String assetPath, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        assetPath,
        width: 50,
        height: 50,
      ),
    );
  }
}
// lib/create_account_screen.dart
import 'package:flutter/material.dart';
import 'package:coba_1/shared_widgets/custom_form_field.dart'; // Impor widget kustom kita
import 'forgot_password_screen.dart'; // Impor halaman lupa password
import 'package:coba_1/features/home/home_screen.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = const Color(0xFFF9F7FF);
    Color primaryColor = const Color(0xFF9634FF);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        // Kita gunakan SingleChildScrollView agar tidak overflow saat keyboard muncul
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
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
                      const SizedBox(width: 20),
                    ],
                  ),
                ),
                const SizedBox(height: 10),

                // 2. Teks "Create an account"
                const Text(
                  "Create an account",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 30),

                // 3. Form Fields
                const CustomFormField(
                  hintText: "Email Address",
                ),
                const SizedBox(height: 20),
                const CustomFormField(
                  hintText: "User Name",
                ),
                const SizedBox(height: 20),
                const CustomFormField(
                  hintText: "Password",
                  obscureText: true,
                ),
                const SizedBox(height: 30),

                // 4. Tombol Submit
                ElevatedButton(
                  onPressed: () {
                    // Ganti logika ini
                    Navigator.pushReplacement( // Langsung ke HomeScreen
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    "SUBMIT",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // 5. Link "Forgot Password"
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ForgotPasswordScreen(),
                      ),
                    );
                  },
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: const TextStyle(fontSize: 15, color: Colors.black54),
                      children: [
                        const TextSpan(text: "Forgot your password? "),
                        TextSpan(
                          text: "Reset here",
                          style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                
                // Kita tambahkan Spacer agar tombol Sign In terdorong ke bawah
                // jika layarnya cukup tinggi
                const SizedBox(height: 60), 

                // 6. Link "Sign In"
                Center(
                  child: Text(
                    "Already have an account",
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 15),
                  ),
                ),
                const SizedBox(height: 15),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context); // Kembali ke halaman Login
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    side: BorderSide(color: primaryColor, width: 2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "SIGN IN",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
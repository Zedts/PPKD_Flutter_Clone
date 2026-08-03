import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ppkd_b7/day_13/bottom_nav.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 34),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 24),

              // Logo
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/logo/smile.png',
                      width: 150,
                      height: 150,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Welcome back!',
                      style: GoogleFonts.workSans(
                        fontSize: 32,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 24),

              // Email
              _buildTextField(
                hintText: 'Email',
                prefixIcon: Icons.mail_outline,
              ),

              SizedBox(height: 16),

              // Password
              _buildTextField(
                hintText: 'Password',
                prefixIcon: Icons.lock_outline,
                obscureText: obscurePassword,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      obscurePassword = !obscurePassword;
                    });
                  },
                  icon: Icon(
                    obscurePassword 
                    ? Icons.visibility_off 
                    : Icons.visibility,
                    color: Colors.grey,
                  ),
                ),
              ),

              SizedBox(height: 8),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot password?',
                    style: GoogleFonts.workSans(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 8),

              // Login button
              SizedBox(
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BottomNavDay13(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF1096F4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Login',
                    style: GoogleFonts.workSans(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 16),

              // Garis "or"
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Color(0xFFD0D0D0),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'or',
                      style: GoogleFonts.workSans(
                        fontSize: 18,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Color(0xFFD0D0D0),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _SocialAssetButton(
                    assetPath: 'assets/images/icons/Facebook.png',
                  ),
                  SizedBox(width: 18),
                  _SocialAssetButton(
                    assetPath: 'assets/images/icons/Google.png',
                  ),
                  SizedBox(width: 18),
                  _SocialAssetButton(
                    assetPath: 'assets/images/icons/Apple.png',
                  ),
                ],
              ),

              Spacer(),

              Center(
                child: RichText(
                  text: TextSpan(
                    style: GoogleFonts.workSans(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(text: "Don't have an account? "),
                      TextSpan(
                        text: 'Sign up',
                        style: GoogleFonts.workSans(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 16),

            ],
          ),
        ),
      ),
    );
  }

  // Reusable TextField
  Widget _buildTextField({
    required String hintText,
    required IconData prefixIcon,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    return TextField(
      obscureText: obscureText,
      style: GoogleFonts.workSans(
        fontSize: 16,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GoogleFonts.workSans(
          fontSize: 16,
          color: Colors.black,
          fontWeight: FontWeight.w400,
        ),
        prefixIcon: Icon(prefixIcon, color: Colors.grey),
        suffixIcon: suffixIcon,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 18,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Colors.black,
            width: 1.1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Colors.black,
            width: 1.3,
          ),
        ),
      ),
    );
  }
}

// Halaman setelah login
class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Next Page',
          style: GoogleFonts.workSans(),
        ),
      ),
      body: Center(
        child: Text(
          'Ini halaman berikutnya setelah Login.',
          style: GoogleFonts.workSans(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

class _SocialAssetButton extends StatelessWidget {
  final String assetPath;

  const _SocialAssetButton({
    required this.assetPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1.5),
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Image.asset(
          assetPath,
          width: 10,
          height: 10,
        ),
      ),
    );
  }
}
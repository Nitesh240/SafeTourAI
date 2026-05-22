import 'package:flutter/material.dart';
import 'profile_setup_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignupPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F9FB),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Container(
            constraints: BoxConstraints(maxWidth: 500),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                // 🔷 LOGO
                SvgPicture.asset(
                'assets/images/icon2.svg',
                width: 80,
                height: 80,
                ),

                SizedBox(height: 10),

                Text(
                  "Create Account",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 5),

                Text(
                  "Join the community of protected travelers today.",
                  style: TextStyle(color: Colors.grey),
                ),

                SizedBox(height: 30),

                // 🧾 FORM CARD
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        color: Colors.black.withOpacity(0.05),
                      )
                    ],
                  ),
                  child: Column(
                    children: [

                      // 👤 NAME
                      buildInput(
                        controller: nameController,
                        hint: "John Doe",
                        label: "Full Name",
                        icon: Icons.person,
                      ),

                      SizedBox(height: 15),

                      // 📧 EMAIL
                      buildInput(
                        controller: emailController,
                        hint: "john@safetour.ai",
                        label: "Email Address",
                        icon: Icons.mail,
                      ),

                      SizedBox(height: 15),

                      // 📞 PHONE
                      buildInput(
                        controller: phoneController,
                        hint: "+1 999 999 9999",
                        label: "Phone Number",
                        icon: Icons.call,
                      ),

                      SizedBox(height: 15),

                      // 🔒 PASSWORD ROW
                      Row(
                        children: [
                          Expanded(
                            child: buildInput(
                              controller: passwordController,
                              hint: "••••••••",
                              label: "Password",
                              icon: Icons.lock,
                              obscure: true,
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: buildInput(
                              controller: confirmController,
                              hint: "••••••••",
                              label: "Confirm",
                              icon: Icons.verified_user,
                              obscure: true,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 20),

                      // ✅ TERMS
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Checkbox(value: false, onChanged: (v) {}),
                          Expanded(
                            child: Text(
                              "I agree to the Terms of Service and Privacy Policy.",
                              style: TextStyle(fontSize: 12),
                            ),
                          )
                        ],
                      ),

                      SizedBox(height: 20),

                      // 🔵 BUTTON
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            backgroundColor: Color(0xFF004AC6),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                             Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ProfileSetupPage()),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Create SafeTour Account",
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(width: 5),
                              Icon(Icons.arrow_forward, color: Colors.white),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),

                // 🔗 LOGIN LINK
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Log in here",
                        style: TextStyle(
                          color: Color(0xFF004AC6),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),

                SizedBox(height: 30),

                // 🔒 TRUST BADGES
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildBadge(Icons.verified_user, "GDPR"),
                    buildBadge(Icons.lock, "Encrypted"),
                    buildBadge(Icons.location_on, "GPS"),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 🔹 INPUT FIELD BUILDER
  Widget buildInput({
    required TextEditingController controller,
    required String hint,
    required String label,
    required IconData icon,
    bool obscure = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 12)),
        SizedBox(height: 5),
        TextField(
          controller: controller,
          obscureText: obscure,
          decoration: InputDecoration(
            prefixIcon: Icon(icon),
            hintText: hint,
            filled: true,
            fillColor: Color(0xFFF2F4F6),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }

  // 🔹 BADGE
  Widget buildBadge(IconData icon, String text) {
    return Column(
      children: [
        Icon(icon, size: 24, color: Colors.grey),
        SizedBox(height: 5),
        Text(text, style: TextStyle(fontSize: 10)),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'signup_page.dart';
import 'home_page.dart';
import 'package:flutter_svg/flutter_svg.dart';
class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F9FB),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 400,
            padding: EdgeInsets.all(20),
            child: Column(
              children: [

                // 🔷 LOGO + TITLE
                Container(
  padding: EdgeInsets.all(15),
  decoration: BoxDecoration(
    color: Colors.blue.withOpacity(0.1),
    borderRadius: BorderRadius.circular(16),
  ),
  child: SvgPicture.asset(
    'assets/images/icon3.svg',
    width: 80,
    height: 80,
  ),
),

                SizedBox(height: 15),

                Text(
                  "SafeTour AI",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[700],
                  ),
                ),

                SizedBox(height: 5),

                Text(
                  "Your secure companion in every journey.",
                  style: TextStyle(color: Colors.grey),
                ),

                SizedBox(height: 30),

                // 🔲 CARD
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        "Welcome back",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 20),

                      // 📧 EMAIL
                      Text("Email Address"),
                      SizedBox(height: 5),

                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.mail),
                          hintText: "name@example.com",
                          filled: true,
                          fillColor: Color(0xFFF2F4F6),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),

                      SizedBox(height: 20),

                      // 🔒 PASSWORD
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Password"),
                          Text(
                            "Forgot?",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 5),

                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          hintText: "••••••••",
                          filled: true,
                          fillColor: Color(0xFFF2F4F6),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),

                      SizedBox(height: 25),

                      // 🔵 LOGIN BUTTON
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            backgroundColor: Color(0xFF004AC6),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                             Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Sign In",
                                style: TextStyle(color: Colors.white), // ✅ FIXED
                              ),
                              SizedBox(width: 5),
                              Icon(Icons.arrow_forward, color: Colors.white), // ✅ FIXED
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 25),

                // 🔘 DIVIDER
                Row(
                  children: [
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text("OR"),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),

                SizedBox(height: 20),

                // 🌐 SOCIAL BUTTONS
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFF2F4F6),
                          foregroundColor: Colors.black,
                        ),
                        child: Text("Google"),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFF2F4F6),
                          foregroundColor: Colors.black,
                        ),
                        child: Text("Apple"),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 25),

                // 🔗 SIGNUP LINK
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignupPage()),
                        );
                      },
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline, // ✅ LINK STYLE
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
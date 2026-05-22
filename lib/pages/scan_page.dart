import 'package:flutter/material.dart';
import '../widgets/bottom_nav.dart';
import 'package:flutter_svg/flutter_svg.dart';


class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Row(
          children: [
            SvgPicture.asset(
                'assets/images/icon2.svg',
                height: 32,   // 👈 control size here
                width: 32,
                fit: BoxFit.contain,
                ),            
                SizedBox(width: 8),
            Text("SafeTour AI",
                style: TextStyle(color: Colors.blue)),
          ],
        ),
        actions: [
          CircleAvatar(
            backgroundImage:
                NetworkImage("https://i.pravatar.cc/150?img=3"),
          ),
          SizedBox(width: 10),
        ],
      ),

      body: Stack(
        children: [

          // 📷 CAMERA BACKGROUND
          Positioned.fill(
            child: Image.network(
              "https://lh3.googleusercontent.com/aida-public/AB6AXuAXwXvQVgzmlzvRS9FmWcSUF_WWJE2KJXmvNenmINZBQvvnvT_brDxEWfeguZio6nOFo2FAdYOjX3xq6BmSLng-AENTRf2w-lRJoq3mT_C87TEg5YYXK1ePCojRk78Q2e-e_KE1fgGTQ8oMNpGrf1dgfYbVHcXAIdL1Ydo4dusb32o-gkp_Lb517YPY_a9r7eRDuOBsINYIsrympcohHVd8y9vUYqgAvK4Xl5gOFskX5FYsMuIknUoJigonJspk5sNUGVqi6QUNous",
              fit: BoxFit.cover,
            ),
          ),

          // 🌑 DARK OVERLAY
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.6),
            ),
          ),

          // 🔳 SCAN AREA
          Center(
            child: Container(
              width: 280,
              height: 280,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
              ),
              child: Stack(
                children: [

                  // CORNERS
                  corner(top: true, left: true),
                  corner(top: true, left: false),
                  corner(top: false, left: true),
                  corner(top: false, left: false),

                  // 🔵 SCAN LINE
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (_, __) {
                      return Positioned(
                        top: 280 * _controller.value,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 2,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.transparent,
                                Colors.blue,
                                Colors.transparent
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),

                  // CENTER ICON
                  Center(
                    child: Icon(Icons.qr_code_scanner,
                        color: Colors.white.withOpacity(0.2),
                        size: 80),
                  ),
                ],
              ),
            ),
          ),

          // 📄 TOP TEXT
          Positioned(
            top: 40,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  "Scan checkpoint QR",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),

          // ✅ ACCESS GRANTED CARD
          Positioned(
            top: 150,
            left: 20,
            right: 20,
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.9),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.check, color: Colors.green),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text("Access Granted",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      Text("Checkpoint Verified",
                          style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12)),
                    ],
                  )
                ],
              ),
            ),
          ),

          // 🔘 BOTTOM BUTTONS
          Positioned(
            bottom: 160,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.center,
              children: [
                control(Icons.flashlight_on),
                SizedBox(width: 20),
                control(Icons.history),
              ],
            ),
          ),

          // 📊 INFO SECTION
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xFFF7F9FB),
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30)),
              ),
              child: Column(
                children: [

                  Text("Checkpoint Status",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),

                  SizedBox(height: 10),

                  Row(
                    children: [
                      stat("Active Site", "Sector 7G"),
                      SizedBox(width: 10),
                      stat("Next Scan", "14:20 PM"),
                    ],
                  ),

                  SizedBox(height: 15),

                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius:
                          BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "AI Anomaly Detection Active",
                            style: TextStyle(
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Icon(Icons.psychology,
                            color: Colors.blue),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: buildBottomNavBar(context, 0),
    );
  }

  // 🔳 CORNERS
  Widget corner({required bool top, required bool left}) {
    return Positioned(
      top: top ? 0 : null,
      bottom: top ? null : 0,
      left: left ? 0 : null,
      right: left ? null : 0,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          border: Border(
            top: top
                ? BorderSide(color: Colors.blue, width: 4)
                : BorderSide.none,
            bottom: !top
                ? BorderSide(color: Colors.blue, width: 4)
                : BorderSide.none,
            left: left
                ? BorderSide(color: Colors.blue, width: 4)
                : BorderSide.none,
            right: !left
                ? BorderSide(color: Colors.blue, width: 4)
                : BorderSide.none,
          ),
        ),
      ),
    );
  }

  // 🔘 BUTTON
  Widget control(IconData icon) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.white),
    );
  }

  // 📊 STAT
  Widget stat(String title, String value) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Text(title,
                style:
                    TextStyle(fontSize: 10, color: Colors.grey)),
            SizedBox(height: 5),
            Text(value,
                style: TextStyle(
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
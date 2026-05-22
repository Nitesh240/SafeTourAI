import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../widgets/bottom_nav.dart';

class SmartIdPage extends StatelessWidget {

  final String qrData = '''
Name: Julian Walters
ID: ST-10234
Blood: O+
Condition: Asthma
Emergency: +91-9876543210
''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F9FB),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            SvgPicture.asset(
              'assets/images/icon2.svg',
              height: 32,
              width: 32,
            ),
            SizedBox(width: 8),
            Text(
              "SafeTour AI",
              style: TextStyle(
                color: Colors.blue[700],
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                "https://i.pravatar.cc/150?img=3",
              ),
            ),
          )
        ],
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              "Smart ID",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 5),

            Text(
              "Your digital safety credentials for seamless verification.",
              style: TextStyle(color: Colors.grey),
            ),

            SizedBox(height: 25),

            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(color: Colors.black12, blurRadius: 10)
                ],
              ),
              child: Column(
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "IDENTITY VERIFIED",
                            style: TextStyle(
                              fontSize: 10,
                              letterSpacing: 2,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Julian Walters",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "ST-10234",
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(Icons.badge, color: Colors.blue),
                      )
                    ],
                  ),

                  SizedBox(height: 25),

                  // 🔥 QR CODE
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [

                        QrImageView(
                          data: qrData,
                          size: 160,
                          backgroundColor: Colors.white,
                        ),

                        Positioned(
                          top: 0,
                          right: 0,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              "ACTIVE",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  SizedBox(height: 15),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.sync, size: 16, color: Colors.grey),
                      SizedBox(width: 5),
                      Text(
                        "Refreshes in 45s",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      )
                    ],
                  ),

                  SizedBox(height: 25),
                  Divider(),
                  SizedBox(height: 15),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("VALID UNTIL", style: TextStyle(fontSize: 10)),
                          Text("Dec 2025",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("ISSUER", style: TextStyle(fontSize: 10)),
                          Text("SafeTour AI Global",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),

            SizedBox(height: 25),

            Row(
              children: [
                Expanded(
                  child: actionCard(
                    icon: Icons.share,
                    title: "Share ID",
                    subtitle: "Send to authorities",
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: actionCard(
                    icon: Icons.download,
                    title: "Save Offline",
                    subtitle: "Export PDF",
                  ),
                ),
              ],
            ),

            SizedBox(height: 25),

            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.05),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(Icons.warning, color: Colors.red),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "Scanning this ID alerts the nearest SafeTour AI support center.",
                      style: TextStyle(fontSize: 12),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),

      // 🔥 ADDED NAVIGATION BAR
      bottomNavigationBar: buildBottomNavBar(context, 3),
    );
  }

  Widget actionCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.blue),
          SizedBox(height: 10),
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Text(subtitle, style: TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }
}
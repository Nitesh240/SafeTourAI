import 'package:flutter/material.dart';
import 'map_page.dart';
import 'sos_page.dart';
import 'scan_page.dart';
import '../widgets/bottom_nav.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
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
                height: 32,   // 👈 control size here
                width: 32,
                fit: BoxFit.contain,
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
            padding: EdgeInsets.only(right: 12),
            child: CircleAvatar(
              backgroundImage:
                  NetworkImage("https://i.pravatar.cc/150?img=3"),
            ),
          )
        ],
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // 🔹 HEADER
            Text(
              "GUARDIAN ACTIVE",
              style: TextStyle(
                fontSize: 10,
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),

            SizedBox(height: 8),

            Text(
              "Hello, Julian Walters",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 25),

            // 🔥 STATUS CARD
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "CURRENT\nSTATUS",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      Text(
                        "PREDICTION: LOW\nRISK",
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),

                  SizedBox(height: 15),

                  Row(
                    children: [
                      Text(
                        "SAFE",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      SizedBox(width: 8),
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                      )
                    ],
                  ),

                  SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF004AC6),
                        padding: EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Check Status",
                              style: TextStyle(color: Colors.white)),
                          SizedBox(width: 6),
                          Icon(Icons.refresh,
                              color: Colors.white, size: 18),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 15),

                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "LIVE TRACKING",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold),
                        ),
                        Switch(value: true, onChanged: (v) {}),
                      ],
                    ),
                  ),

                  SizedBox(height: 15),

                  Row(
                    children: [
                      CircleAvatar(radius: 10, backgroundColor: Colors.grey),
                      SizedBox(width: 5),
                      CircleAvatar(radius: 10, backgroundColor: Colors.grey),
                      SizedBox(width: 10),
                      Text(
                        "2 Security Nodes\nActively Monitoring",
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 25),

            // 🔥 ACTION BUTTONS
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                actionButton(
                  context,
                  Icons.map,
                  "VIEW MAP",
                  false,
                  MapPage(),
                ),

                actionButton(
                  context,
                  Icons.warning,
                  "SOS\nBUTTON",
                  true,
                  SosPage(),
                ),

                actionButton(
                  context,
                  Icons.qr_code_scanner,
                  "SCAN QR",
                  false,
                  ScanPage(),
                ),
              ],
            ),

            SizedBox(height: 25),

            // 🔹 LOCAL INSIGHTS
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Local Insights",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text("SEE DETAILED ANALYSIS",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 12,
                        fontWeight: FontWeight.bold)),
              ],
            ),

            SizedBox(height: 15),

            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Icon(Icons.shield, color: Colors.blue),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Active Curfew Zone",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 5),
                        Text(
                          "District 4 is under heightened awareness from 10 PM.",
                          style: TextStyle(
                              fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, size: 14),
                ],
              ),
            ),

            SizedBox(height: 20),

            // 🔹 MAP PREVIEW
            Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(
                      "https://maps.googleapis.com/maps/api/staticmap?center=12.9716,77.5946&zoom=13&size=600x300"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Center(
                    child: Icon(Icons.location_pin,
                        color: Colors.red, size: 30),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            "LIVE TRACKING ACTIVE",
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // 🔥 NAV BAR
      bottomNavigationBar: buildBottomNavBar(context, 0),
    );
  }

  // 🔥 CLICKABLE BUTTON
  Widget actionButton(
    BuildContext context,
    IconData icon,
    String text,
    bool isSOS,
    Widget page,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => page),
        );
      },
      child: Container(
        width: 100,
        padding: EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          color: isSOS ? Colors.red : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSOS ? Colors.red : Colors.blue,
            width: 1.5,
          ),
        ),
        child: Column(
          children: [
            Icon(icon,
                color: isSOS ? Colors.white : Colors.blue),
            SizedBox(height: 10),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: isSOS ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
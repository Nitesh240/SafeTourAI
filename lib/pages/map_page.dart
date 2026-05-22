import 'package:flutter/material.dart';
import '../widgets/bottom_nav.dart';
import 'package:flutter_svg/flutter_svg.dart';


class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F9FB),

      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.8),
        elevation: 0,
        title: Row(
          children: [
            SvgPicture.asset(
                'assets/images/icon2.svg',
                height: 32,   // 👈 control size here
                width: 32,
                fit: BoxFit.contain,
                ),            SizedBox(width: 8),
            Text(
              "SafeTour AI",
              style: TextStyle(
                color: Color(0xFF004AC6),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          Icon(Icons.search, color: Colors.grey),
          SizedBox(width: 10),
          CircleAvatar(
            backgroundImage:
                NetworkImage("https://i.pravatar.cc/150?img=3"),
          ),
          SizedBox(width: 10),
        ],
      ),

      body: SafeArea(
        child: Stack(
          children: [

            // 🗺 MAP BACKGROUND
            Positioned.fill(
              child: Image.network(
                "https://lh3.googleusercontent.com/aida-public/AB6AXuDl7li5YAVy0BDRfMaXeuS9EUE6Uex-Lq__UJOGln-R9au9tIFnpJuEpTJulMvrqZuNF5p15VwRtme33YBbEaY1gLFhWqTW-WIH7cHp6xxYY7daQkJg_z3q9M3_xp5Fnb04fviYDGzQ9npTEl99B4nOdkuRuWqaCxl0KbEUpHftgBZ23Ev8aq1Mw7PhIlXJGc09E4Fb4CD8xJItazRnHAlPIrLPSB_h0yERSmg27Rd-_f8ynnMkg7IKvDNGVrVN4setQ5eafG4HxZ0",
                fit: BoxFit.cover,
              ),
            ),

            // 🌫 GRADIENT OVERLAY
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.9),
                      Colors.transparent,
                      Colors.transparent,
                      Colors.white.withOpacity(0.9),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),

            // 🔴 HIGH RISK ZONE
            Positioned(
              top: 220,
              left: 100,
              child: zone("HIGH RISK", Colors.red),
            ),

            // 🟢 SAFE ZONE
            Positioned(
              bottom: 220,
              right: 80,
              child: zone("SAFE ZONE", Colors.green),
            ),

            // 📍 LOCATION + PULSE
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.2),
                          shape: BoxShape.circle,
                        ),
                      ),
                      Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 3),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text("You are here",
                            style: TextStyle(fontSize: 11)),
                      ],
                    ),
                  )
                ],
              ),
            ),

            // 🔝 STATUS CARD
            Positioned(
              top: 20,
              left: 20,
              child: Container(
                padding:
                    EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.95),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Icon(Icons.verified_user,
                        color: Colors.green, size: 18),
                    SizedBox(width: 6),
                    Text(
                      "MONITORING ACTIVE",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),

            // 🔘 RIGHT CONTROLS
            Positioned(
              right: 15,
              top: MediaQuery.of(context).size.height * 0.3,
              child: Column(
                children: [
                  control(Icons.layers),
                  SizedBox(height: 12),
                  control(Icons.my_location),
                  SizedBox(height: 12),
                  Divider(),
                  control(Icons.add),
                  SizedBox(height: 12),
                  control(Icons.remove),
                ],
              ),
            ),

            // 🚗 BOTTOM CARD
            Positioned(
              bottom: 140,
              left: 20,
              right: 20,
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.95),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(Icons.route, color: Colors.blue),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text("Safe Walk Active",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold)),
                          Text("ETA 12 mins • Home",
                              style: TextStyle(fontSize: 12)),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF004AC6),
                        shape: StadiumBorder(),
                      ),
                      onPressed: () {},
                      child: Text("View Details"),
                    )
                  ],
                ),
              ),
            ),

            // 🚨 SOS BUTTON
            Positioned(
              bottom: 80,
              left: MediaQuery.of(context).size.width / 2 - 40,
              child: Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.red, Colors.redAccent],
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.emergency,
                        color: Colors.white, size: 40),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "EMERGENCY SOS",
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  )
                ],
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: buildBottomNavBar(context, 1),
    );
  }

  // 🔴 ZONE
  Widget zone(String text, Color color) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        shape: BoxShape.circle,
        border: Border.all(
            color: color.withOpacity(0.4), style: BorderStyle.solid),
      ),
      child: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  // 🔘 CONTROL BUTTON
  Widget control(IconData icon) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Icon(icon),
    );
  }
}
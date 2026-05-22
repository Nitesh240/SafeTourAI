import 'package:flutter/material.dart';
import '../widgets/bottom_nav.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F9FB),

      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.9),
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
                color: Color(0xFF004AC6),
                fontWeight: FontWeight.bold,
              ),
            ),
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

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              SizedBox(height: 20),

              // 🚨 EMERGENCY TITLE
              Text(
                "EMERGENCY MODE",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFCF2C30),
                ),
              ),

              SizedBox(height: 10),

              // 🔴 ALERT SENT
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  color: Color(0xFFCF2C30).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: Color(0xFFCF2C30),
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 6),
                    Text(
                      "ALERT SENT TO ADMIN",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFCF2C30),
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(height: 40),

              // 🚨 BIG SOS BUTTON
              Stack(
                alignment: Alignment.center,
                children: [

                  Container(
                    width: 260,
                    height: 260,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: Colors.red.withOpacity(0.2), width: 2),
                    ),
                  ),

                  Container(
                    width: 220,
                    height: 220,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: Colors.red.withOpacity(0.1), width: 1),
                    ),
                  ),

                  Container(
                    width: 180,
                    height: 180,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFFCF2C30), Colors.redAccent],
                      ),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.red.withOpacity(0.3),
                          blurRadius: 30,
                        )
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.emergency,
                            size: 60, color: Colors.white),
                        SizedBox(height: 8),
                        Text(
                          "SOS",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 40),

              // 📍 LOCATION CARD
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "LIVE TRACKING",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                        Icon(Icons.location_on, color: Colors.blue),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text("Lat: 40.7128, Long: -74.0060",
                        style: TextStyle(fontSize: 12)),
                    SizedBox(height: 5),
                    Text("New York City, NY",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),

              SizedBox(height: 15),

              // ⚠️ STATUS + RESPONSE
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [

                    // STATUS
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.warning,
                                color: Colors.red, size: 30),
                            SizedBox(height: 10),
                            Text("STATUS",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey)),
                            Text("Critical",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(width: 10),

                    // RESPONSE
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.support_agent,
                                color: Colors.blue, size: 30),
                            SizedBox(height: 10),
                            Text("RESPONSE",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey)),
                            Text("Dispatching",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              // 📄 INSTRUCTION
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Emergency services and tour administrators have been notified of your exact coordinates. Please stay where you are unless in immediate danger.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                ),
              ),

              SizedBox(height: 100),
            ],
          ),
        ),
      ),

      bottomNavigationBar: buildBottomNavBar(context, 2),
    );
  }
}

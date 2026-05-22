import 'package:flutter/material.dart';
import 'smart_id_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileSetupPage extends StatefulWidget {
  @override
  _ProfileSetupPageState createState() => _ProfileSetupPageState();
}

class _ProfileSetupPageState extends State<ProfileSetupPage> {
  final TextEditingController ageController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otherController = TextEditingController();

  String selectedGender = "Select gender";
  String selectedBlood = "Select blood type";

  List<String> conditions = [
    "Asthma",
    "Diabetes",
    "Epilepsy",
    "Allergies",
    "Hypertension"
  ];

  Set<String> selectedConditions = {};

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
            Text("SafeTour AI", style: TextStyle(color: Colors.blue[700])),
          ],
        ),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              "Secure Your Journey",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 5),

            Text(
              "Provide your health data for safety monitoring.",
              style: TextStyle(color: Colors.grey),
            ),

            SizedBox(height: 25),

            // 🩺 HEALTH INFO
            buildCard(
              title: "Essential Health Info",
              child: Column(
                children: [

                  buildInput("Age", ageController),

                  SizedBox(height: 15),

                  DropdownButtonFormField(
                    value: selectedGender,
                    items: [
                      "Select gender",
                      "Male",
                      "Female",
                      "Other"
                    ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                    onChanged: (val) {
                      setState(() {
                        selectedGender = val!;
                      });
                    },
                    decoration: inputDecoration("Gender"),
                  ),

                  SizedBox(height: 15),

                  DropdownButtonFormField(
                    value: selectedBlood,
                    items: [
                      "Select blood type",
                      "A+", "A-", "B+", "B-",
                      "O+", "O-", "AB+", "AB-"
                    ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
                    onChanged: (val) {
                      setState(() {
                        selectedBlood = val!;
                      });
                    },
                    decoration: inputDecoration("Blood Group"),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // 🧠 MEDICAL CONDITIONS
            buildCard(
              title: "Medical Conditions",
              child: Column(
                children: [

                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: conditions.map((condition) {
                      final isSelected = selectedConditions.contains(condition);

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            if (isSelected) {
                              selectedConditions.remove(condition);
                            } else {
                              selectedConditions.add(condition);
                            }
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Colors.blue.withOpacity(0.2)
                                : Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                isSelected ? Icons.check_circle : Icons.add,
                                size: 16,
                                color: isSelected ? Colors.blue : Colors.grey,
                              ),
                              SizedBox(width: 5),
                              Text(condition),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),

                  SizedBox(height: 15),

                  // ✏️ OTHER CONDITION
                  TextField(
                    controller: otherController,
                    decoration: inputDecoration("Other condition (if any)"),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // ❤️ VITALS (DISPLAY ONLY)
            Row(
              children: [
                Expanded(
                  child: buildVitalDisplay(
                    icon: Icons.favorite,
                    color: Colors.red,
                    label: "Heart Rate",
                    value: "-- bpm",
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: buildVitalDisplay(
                    icon: Icons.air,
                    color: Colors.blue,
                    label: "Oxygen Level",
                    value: "-- %",
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            // 🚨 EMERGENCY CONTACT
            buildCard(
              title: "Emergency Contact",
              child: TextField(
                controller: phoneController,
                decoration: inputDecoration("Guardian Phone Number")
                    .copyWith(prefixIcon: Icon(Icons.call)),
              ),
            ),

            SizedBox(height: 25),

            // 🔵 BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF004AC6),
                  padding: EdgeInsets.symmetric(vertical: 18),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SmartIdPage()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Save & Continue", style: TextStyle(color: Colors.white)),
                    SizedBox(width: 5),
                    Icon(Icons.arrow_forward, color: Colors.white),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 CARD
  Widget buildCard({required String title, required Widget child}) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          child,
        ],
      ),
    );
  }

  // 🔹 INPUT
  Widget buildInput(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: inputDecoration(label),
    );
  }

  // 🔹 DECORATION
  InputDecoration inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      filled: true,
      fillColor: Color(0xFFF2F4F6),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
    );
  }

  // 🔹 VITAL DISPLAY
  Widget buildVitalDisplay({
    required IconData icon,
    required Color color,
    required String label,
    required String value,
  }) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 30),
          SizedBox(height: 10),
          Text(label),
          SizedBox(height: 5),
          Text(
            value,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
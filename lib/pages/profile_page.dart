import 'package:flutter/material.dart';
import '../widgets/bottom_nav.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FB),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            SvgPicture.asset(
              'assets/images/icon2.svg',
              height: 28,
              width: 28,
            ),
            const SizedBox(width: 8),
            const Text(
              "SafeTour AI",
              style: TextStyle(
                color: Color(0xFF004AC6),
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: Colors.orange,
              child: CircleAvatar(
                radius: 15,
                backgroundImage: NetworkImage(
                  "https://i.pravatar.cc/150?img=3",
                ),
              ),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(18, 25, 18, 120),
        child: Column(
          children: [

            // PROFILE IMAGE CENTER
            Stack(
              children: [
                Container(
                  width: 95,
                  height: 95,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 20,
                        color: Colors.black12,
                      )
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(28),
                    child: Image.network(
                      "https://i.pravatar.cc/300?img=3",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    padding: const EdgeInsets.all(7),
                    decoration: const BoxDecoration(
                      color: Color(0xFF004AC6),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                      size: 14,
                    ),
                  ),
                )
              ],
            ),

            const SizedBox(height: 18),

            const Text(
              "Marcus Vance",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
              ),
            ),

            const SizedBox(height: 5),

            Text(
              "Premium Member • Since 2023",
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 12,
              ),
            ),

            const SizedBox(height: 15),

            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center,
              children: [

                badge(
                  "VERIFIED",
                  Colors.grey.shade200,
                  Colors.black54,
                ),

                const SizedBox(width: 8),

                badge(
                  "ACTIVE PROTECTION",
                  const Color(0xFFDDE9FF),
                  const Color(0xFF004AC6),
                )
              ],
            ),

            const SizedBox(height: 28),

            profileCard(
              icon: Icons.badge,
              iconBg: const Color(0xFFDDE9FF),
              iconColor: const Color(0xFF004AC6),
              title: "View Smart ID",
              subtitle:
                  "Digital emergency credentials",
            ),

            const SizedBox(height: 15),

            profileCard(
              icon: Icons.edit_square,
              iconBg: Colors.grey.shade200,
              iconColor: Colors.grey,
              title: "Edit Profile",
              subtitle:
                  "Personal info and preferences",
            ),

            const SizedBox(height: 18),

            smallTile(
              Icons.settings,
              "Security Settings",
            ),

            smallTile(
              Icons.notifications_active,
              "Alert Preferences",
            ),

            smallTile(
              Icons.help_center,
              "Support Center",
            ),

            smallTile(
              Icons.policy,
              "Privacy Policy",
            ),

            const SizedBox(height: 25),

            TextButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.logout,
                color: Colors.red,
              ),
              label: const Text(
                "Logout",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar:
          buildBottomNavBar(context, 3),
    );
  }

  Widget badge(
      String text,
      Color bg,
      Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: bg,
        borderRadius:
            BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget profileCard({
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(24),
      ),
      child: Row(
        children: [

          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius:
                  BorderRadius.circular(15),
            ),
            child: Icon(
              icon,
              color: iconColor,
            ),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [

                Text(
                  title,
                  style: const TextStyle(
                    fontWeight:
                        FontWeight.bold,
                    fontSize: 18,
                  ),
                ),

                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    color:
                        Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),

          const Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Colors.grey,
          )
        ],
      ),
    );
  }

  Widget smallTile(
      IconData icon,
      String title) {
    return Container(
      margin:
          const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(18),
      ),
      child: Row(
        children: [

          Icon(
            icon,
            color: Colors.black54,
            size: 20,
          ),

          const SizedBox(width: 12),

          Text(
            title,
            style: const TextStyle(
              fontWeight:
                  FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
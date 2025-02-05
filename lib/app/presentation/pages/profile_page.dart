import 'package:flutter/material.dart';
import 'package:my_caliana_apps/app/core/constant/path.dart';
import 'package:my_caliana_apps/app/core/constant/style.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CalianaLogo',
          style: TextStyle(color: StyleConstant.primaryColor, fontSize: 20),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.notifications_outlined,
              color: StyleConstant.primaryColor,
              size: 28,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Column(
                children: [
                  // Avatar
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(PathConstant.avatarPath),
                  ),
                  const SizedBox(height: 16),
                  // Nama pengguna
                  const Text(
                    'Operator MyCaliana',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Email pengguna
                  const Text(
                    'interviewcaliana@gmail.com',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView(
                children: [
                  _buildMenuSection(
                    context,
                    items: [
                      _buildMenuItem(
                        context,
                        icon: Icons.person_outline,
                        title: 'Data Diri',
                        onTap: () {},
                      ),
                      Divider(height: 1, color: Colors.grey.withOpacity(0.5)),
                      _buildMenuItem(
                        context,
                        icon: Icons.settings_outlined,
                        title: 'Pengaturan',
                        onTap: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildMenuSection(
                    context,
                    items: [
                      _buildMenuItem(
                        context,
                        icon: Icons.help_outline,
                        title: 'Bantuan',
                        onTap: () {},
                      ),
                      Divider(height: 1, color: Colors.grey.withOpacity(0.5)),
                      _buildMenuItem(
                        context,
                        icon: Icons.logout_outlined,
                        title: 'Keluar',
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuSection(BuildContext context,
      {required List<Widget> items}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: items,
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context,
      {required IconData icon,
      required String title,
      required VoidCallback onTap}) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: Colors.blue),
          title: Text(
            title,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: StyleConstant.primaryColor),
          ),
          trailing: const Icon(Icons.arrow_forward_ios,
              color: StyleConstant.primaryColor, size: 16),
          onTap: onTap,
        ),
      ],
    );
  }
}

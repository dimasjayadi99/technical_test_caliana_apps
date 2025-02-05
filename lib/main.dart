import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:my_caliana_apps/app/config/routes/router_config.dart';
import 'package:my_caliana_apps/app/core/constant/path.dart';
import 'package:my_caliana_apps/app/core/utils/space_extension.dart';
import 'package:my_caliana_apps/app/presentation/pages/home_page.dart';
import 'package:my_caliana_apps/app/presentation/pages/notification_page.dart';
import 'package:my_caliana_apps/app/presentation/pages/pra_registration_page.dart';
import 'package:my_caliana_apps/app/presentation/pages/profile_page.dart';
import 'package:my_caliana_apps/app/presentation/pages/registration_page.dart';

import 'app/core/constant/style.dart';

void main() {
  initializeDateFormatting('id_ID', null);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: PathConstant.splashScreen,
      getPages: MyRouterConfig().listPages,
    );
  }
}

class CustomBottomNavigation extends StatefulWidget {
  const CustomBottomNavigation({super.key});

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentIndex = 0;

  List<IconData> iconList = [Icons.home_outlined, Icons.person_outline_rounded];
  List<String> labelList = ["Beranda", "Profil"];
  List<Widget> listFrame = [
    const HomePage(),
    const ProfilePage(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CalianaLogo',
          style: TextStyle(color: StyleConstant.primaryColor, fontSize: 20),
        ),
        actions: [
          if (_currentIndex == 0)
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.centerLeft,
              children: [
                Positioned(
                  right: 32,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(100),
                        bottomLeft: Radius.circular(100),
                        topRight: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                      border: Border.all(color: Colors.grey.shade300, width: 2),
                    ),
                    child: Container(
                      constraints: const BoxConstraints(
                        maxWidth: 70,
                      ),
                      child: const Text(
                        'Operator MyCaliana',
                        style: TextStyle(color: Colors.grey),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.grey.shade300,
                      width: 2,
                    ),
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      PathConstant.avatarPath,
                      width: 42,
                      height: 42,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          16.horizontalSpace,
          GestureDetector(
            onTap: () {
              Get.to(NotificationPage());
            },
            child: Container(
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
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(listFrame.length, (index) => listFrame[index]),
      ),
      floatingActionButton: SpeedDial(
        backgroundColor: Colors.white,
        icon: Icons.add,
        activeIcon: Icons.close,
        spacing: 12,
        spaceBetweenChildren: 8,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.file_open_outlined),
            label: 'Pra Registrasi',
            backgroundColor: Colors.white,
            onTap: () {
              Get.to(PraRegistrationPage());
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.person_pin_outlined),
            label: 'Registrasi',
            backgroundColor: Colors.white,
            onTap: () {
              Get.to(RegistrationPage());
            },
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        height: 75,
        notchMargin: 12,
        itemCount: iconList.length,
        tabBuilder: (int index, bool isActive) {
          final color = isActive ? Colors.blue : Colors.grey;
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(iconList[index], color: color, size: 24),
              const SizedBox(height: 4),
              Text(
                labelList[index],
                style: TextStyle(color: color, fontSize: 12),
              ),
            ],
          );
        },
        backgroundColor: Colors.white,
        activeIndex: _currentIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.defaultEdge,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
          _pageController.jumpToPage(index);
        },
      ),
    );
  }
}

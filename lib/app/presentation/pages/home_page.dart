import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_caliana_apps/app/core/constant/path.dart';
import 'package:my_caliana_apps/app/core/shared/widgets/custom_button.dart';
import 'package:my_caliana_apps/app/core/utils/space_extension.dart';
import 'package:intl/intl.dart';
import '../../core/constant/style.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> listCategoryFeatures = [
    'Semua Fitur',
    'Visitor Management System',
    'Access Control System'
  ];

  final List<FeaturesIconModel> listFeatures = [
    FeaturesIconModel(label: 'Dasbor', icon: Icons.insert_chart_outlined),
    FeaturesIconModel(label: 'Daftar Pengunjung', icon: Icons.switch_account),
    FeaturesIconModel(label: 'Residen', icon: Icons.home_outlined),
  ];

  int activeTabIndex = 0;

  String getFormattedDate() {
    DateTime now = DateTime.now();

    String day = DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(now);
    String time = DateFormat('HH:mm:ss').format(now);
    return '$day\n$time';
  }

  late Timer _timer;
  DateTime _currentTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    _startLiveClock();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startLiveClock() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        _currentTime = DateTime.now();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 3.5;
    final double itemWidth = size.width / 1.5;

    return Scaffold(
      backgroundColor: StyleConstant.whiteColor,
      appBar: AppBar(
        title: const Text(
          'CalianaLogo',
          style: TextStyle(color: StyleConstant.primaryColor, fontSize: 20),
        ),
        actions: [
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
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      getFormattedDate().split('\n')[0],
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                    8.verticalSpace,
                    // Waktu Live
                    Text(
                      DateFormat('HH:mm:ss').format(_currentTime),
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.black),
                    ),
                    24.verticalSpace,
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none),
                        hintText: 'Cari...',
                        hintStyle: const TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
              8.verticalSpace,
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Fitur',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    16.verticalSpace,
                    SizedBox(
                      height: 40,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            final isActive = index == activeTabIndex;
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  activeTabIndex = index;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                height: 40,
                                decoration: BoxDecoration(
                                  color: isActive
                                      ? Colors.blue.withOpacity(0.1)
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Center(
                                  child: Text(
                                    listCategoryFeatures[index],
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                            color: StyleConstant.primaryColor,
                                            fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) =>
                              16.horizontalSpace,
                          itemCount: listCategoryFeatures.length),
                    ),
                    32.verticalSpace,
                    GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: (itemWidth / itemHeight),
                      physics: const NeverScrollableScrollPhysics(),
                      children: List.generate(3, (index) {
                        return _buildFeatureIcon(index, context);
                      }),
                    ),
                  ],
                ),
              ),
              32.verticalSpace,
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Hari Ini',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    32.verticalSpace,
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Belum Ada Pengunjung Baru',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w700)),
                          Text('Pengunjung menunggu akan ditampilkan disini',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(color: Colors.grey)),
                          12.verticalSpace,
                          ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxWidth: 120,
                            ),
                            child: CustomButton()
                                .outlineButton(context, 'Refresh', () {}),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildFeatureIcon(int index, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          listFeatures[index].icon,
          color: Colors.grey,
        ),
        8.verticalSpace,
        Text(
          listFeatures[index].label,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Colors.grey),
        )
      ],
    );
  }
}

class FeaturesIconModel {
  final String label;
  final IconData icon;

  FeaturesIconModel({required this.label, required this.icon});
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_caliana_apps/app/core/constant/style.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> notifications = [
      {
        'date': DateTime(2025, 2, 5, 10, 2),
        'title': 'Berhasil Registrasi',
        'description': 'test berhasil registrasi',
      },
      {
        'date': DateTime(2025, 2, 5, 10, 2),
        'title': 'Berhasil Check In',
        'description': 'test berhasil check in',
      },
      {
        'date': DateTime(2025, 2, 5, 1, 12),
        'title': 'Berhasil Check Out',
        'description': 'test berhasil check out',
      },
      {
        'date': DateTime(2025, 2, 5, 1, 11),
        'title': 'Berhasil Registrasi',
        'description': 'test berhasil registrasi',
      },
      {
        'date': DateTime(2025, 2, 4, 2, 34),
        'title': 'Berhasil Registrasi',
        'description': 'sjsjs berhasil registrasi',
      },
    ];

    final groupedNotifications = <String, List<Map<String, dynamic>>>{};

    for (var notification in notifications) {
      final dateKey = DateFormat('dd MMM yyyy').format(notification['date']);
      if (!groupedNotifications.containsKey(dateKey)) {
        groupedNotifications[dateKey] = [];
      }
      groupedNotifications[dateKey]?.add(notification);
    }

    return Scaffold(
      backgroundColor: StyleConstant.whiteColor,
      appBar: AppBar(
        backgroundColor: StyleConstant.whiteColor,
        title: const Text('Pemberitahuan'),
        centerTitle: true,
        elevation: 1,
      ),
      body: SafeArea(
        child: Container(
          color: StyleConstant.whiteColor,
          child: ListView.builder(
            padding: const EdgeInsets.all(24.0),
            itemCount: groupedNotifications.keys.length,
            itemBuilder: (context, index) {
              final dateKey = groupedNotifications.keys.elementAt(index);
              final notificationsByDate = groupedNotifications[dateKey] ?? [];

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      dateKey,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  ...notificationsByDate.map((notification) {
                    return Card(
                      color: Colors.white,
                      margin: const EdgeInsets.only(bottom: 8.0),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        minVerticalPadding: 18,
                        leading: CircleAvatar(
                          backgroundColor: Colors.blue.withOpacity(0.1),
                          child: const Icon(
                            Icons.person_outline_rounded,
                            color: Colors.blue,
                            size: 18,
                          ),
                        ),
                        title: Text(
                          notification['title'],
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              notification['description'],
                              style: const TextStyle(fontSize: 12),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${DateFormat('EEEE, dd MMM yyyy', 'id_ID').format(notification['date'])} | ${DateFormat('HH:mm', 'id_ID').format(notification['date'])} WIB',
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

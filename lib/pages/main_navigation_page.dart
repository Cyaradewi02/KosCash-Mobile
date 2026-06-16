import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

import 'home_page.dart';
import 'statistics_page.dart';
import 'add_transaction_page.dart';
import 'saving_page.dart';
import 'profile_page.dart';

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() =>
      _MainNavigationPageState();
}

class _MainNavigationPageState
    extends State<MainNavigationPage> {

  int currentIndex = 0;

  final List<Widget> pages = const [
    HomePage(),
    StatisticsPage(),
    AddTransactionPage(),
    SavingPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,

        type: BottomNavigationBarType.fixed,

        backgroundColor: const Color(0xFF1A1028),

        selectedItemColor:
        AppColors.primaryPurple,

        unselectedItemColor:
        Colors.white54,

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: "Statistik",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle),
            label: "Tambah",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.savings),
            label: "Hemat",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profil",
          ),
        ],
      ),
    );
  }
}
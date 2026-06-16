import 'package:flutter/material.dart';
import '../models/transaction_model.dart';
import '../constants/app_colors.dart';

import 'home_page.dart';
import 'statistics_page.dart';
import 'add_transaction_page.dart';
import 'saving_page.dart';
import 'profile_page.dart';

class MainNavigationPage extends StatefulWidget {
  final String userName;
  final String userEmail;

  const MainNavigationPage({
    super.key,
    required this.userName,
    required this.userEmail,
  });

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int currentIndex = 0;

  List<TransactionModel> transactions = [];

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomePage(transactions: transactions),

      StatisticsPage(transactions: transactions),

      AddTransactionPage(
        onAddTransaction: (transaction) {
          setState(() {
            transactions.add(transaction);
            currentIndex = 0;
          });
        },
      ),

      SavingPage(transactions: transactions),

      ProfilePage(
        userName: widget.userName,
        userEmail: widget.userEmail,
      ),
    ];

    return Scaffold(
      body: pages[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF1A1028),
        selectedItemColor: AppColors.primaryPurple,
        unselectedItemColor: Colors.white54,
        onTap: (index) {
          setState(() => currentIndex = index);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "Statistik"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Tambah"),
          BottomNavigationBarItem(icon: Icon(Icons.savings), label: "Hemat"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
        ],
      ),
    );
  }
}
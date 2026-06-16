import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../models/transaction_model.dart';

class SavingPage extends StatelessWidget {
  final List<TransactionModel> transactions;

  const SavingPage({
    super.key,
    required this.transactions,
  });

  int get totalPengeluaran {
    return transactions.fold(
      0,
          (sum, item) => sum + item.amount,
    );
  }

  final int budgetHemat = 1400000;

  @override
  Widget build(BuildContext context) {
    double progress = totalPengeluaran / budgetHemat;

    if (progress > 1) {
      progress = 1;
    }

    String status;
    Color statusColor;

    if (totalPengeluaran < budgetHemat * 0.5) {
      status = "🟢 Pengeluaran masih aman";
      statusColor = Colors.green;
    } else if (totalPengeluaran < budgetHemat) {
      status = "🟡 Mulai kurangi pengeluaran";
      statusColor = Colors.orange;
    } else {
      status = "🔴 Aktifkan mode hemat";
      statusColor = Colors.red;
    }

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.backgroundStart,
              AppColors.backgroundEnd,
            ],
          ),
        ),
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              const Text(
                "Mode Hemat",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Text(
                  status,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.cardColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  children: [
                    const Text(
                      "Target Budget Hemat",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      "Rp $budgetHemat",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 15),

                    LinearProgressIndicator(
                      value: progress,
                      minHeight: 8,
                      borderRadius: BorderRadius.circular(10),
                    ),

                    const SizedBox(height: 15),

                    Text(
                      "Pengeluaran saat ini : Rp $totalPengeluaran",
                      style: const TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              _tip(
                "🍜",
                "Masak sendiri",
                "Hemat hingga 60%",
              ),

              _tip(
                "🚶",
                "Jalan kaki",
                "Skip ojol untuk jarak dekat",
              ),

              _tip(
                "☕",
                "Kurangi jajan",
                "Batasi kopi 2x seminggu",
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _tip(
      String emoji,
      String title,
      String subtitle,
      ) {
    return Card(
      color: AppColors.cardColor,
      child: ListTile(
        leading: Text(
          emoji,
          style: const TextStyle(fontSize: 24),
        ),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(color: Colors.white70),
        ),
      ),
    );
  }
}
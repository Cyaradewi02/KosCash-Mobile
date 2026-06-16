import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../models/transaction_model.dart';

class StatisticsPage extends StatelessWidget {
  final List<TransactionModel> transactions;

  const StatisticsPage({
    super.key,
    required this.transactions,
  });

  int get totalPengeluaran {
    return transactions.fold(
      0,
          (sum, item) => sum + item.amount,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.backgroundStart,
              AppColors.backgroundEnd,
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Statistik",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  "Pantau pengeluaranmu setiap hari",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),

                const SizedBox(height: 25),

                Row(
                  children: [
                    Expanded(
                      child: _summaryCard(
                        "Bulan Ini",
                        "Rp $totalPengeluaran",
                        "${transactions.length} transaksi",
                      ),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: _summaryCard(
                        "Rata-rata/Hari",
                        transactions.isEmpty
                            ? "Rp 0"
                            : "Rp ${(totalPengeluaran / 7).toStringAsFixed(0)}",
                        "7 hari terakhir",
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.cardColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Daftar Transaksi",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 20),

                      if (transactions.isEmpty)
                        const Text(
                          "Belum ada transaksi",
                          style: TextStyle(color: Colors.white70),
                        ),

                      ...transactions.map(
                            (item) => Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    item.category,
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),

                                  Text(
                                    "Rp ${item.amount}",
                                    style: const TextStyle(
                                      color: Colors.white70,
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 5),

                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  item.note,
                                  style: const TextStyle(
                                    color: Colors.white54,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.cardColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "7 Hari Terakhir",
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        "Rp $totalPengeluaran",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 5),

                      const Text(
                        "Total pengeluaran minggu ini",
                        style: TextStyle(
                          color: Colors.white54,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget _summaryCard(
      String title,
      String amount,
      String subtitle) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white70,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            amount,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 5),

          Text(
            subtitle,
            style: const TextStyle(
              color: Colors.white54,
            ),
          ),
        ],
      ),
    );
  }
}
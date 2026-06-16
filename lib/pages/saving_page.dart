import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class SavingPage extends StatelessWidget {
  const SavingPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                  color: Colors.green.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Mode Hemat",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    Switch(
                      value: true,
                      onChanged: null,
                    ),
                  ],
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
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 10),

                    const Text(
                      "Rp 1.400.000",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 15),

                    LinearProgressIndicator(
                      value: 0.10,
                      minHeight: 8,
                      borderRadius:
                      BorderRadius.circular(10),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              _tip("🍜", "Masak sendiri",
                  "Hemat hingga 60%"),
              _tip("🚶", "Jalan kaki",
                  "Skip ojol untuk jarak dekat"),
              _tip("☕", "Kurangi jajan",
                  "Batasi kopi 2x seminggu"),
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
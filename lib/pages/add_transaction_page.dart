import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../models/transaction_model.dart';

class AddTransactionPage extends StatefulWidget {
  final Function(TransactionModel) onAddTransaction;

  const AddTransactionPage({
    super.key,
    required this.onAddTransaction,
  });

  @override
  State<AddTransactionPage> createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  final amountController = TextEditingController();
  final noteController = TextEditingController();

  String selectedCategory = "Makan";

  final List<String> categories = [
    "Makan",
    "Transport",
    "Belanja",
    "Hiburan",
    "Lainnya",
  ];

  @override
  void dispose() {
    amountController.dispose();
    noteController.dispose();
    super.dispose();
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
                  "Tambah Pengeluaran",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Catat pengeluaranmu hari ini",
                  style: TextStyle(color: Colors.white70),
                ),

                const SizedBox(height: 30),

                _buildCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Kategori",
                        style: TextStyle(color: Colors.white),
                      ),

                      const SizedBox(height: 10),

                      DropdownButtonFormField<String>(
                        value: selectedCategory,
                        dropdownColor: AppColors.cardColor,
                        style: const TextStyle(color: Colors.white),
                        decoration: _inputDecoration(),
                        items: categories
                            .map(
                              (e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ),
                        )
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedCategory = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 15),

                _buildCard(
                  child: TextField(
                    controller: amountController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Colors.white),
                    decoration: _inputDecoration(
                      label: "Nominal Pengeluaran",
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                _buildCard(
                  child: TextField(
                    controller: noteController,
                    maxLines: 3,
                    style: const TextStyle(color: Colors.white),
                    decoration: _inputDecoration(
                      label: "Keterangan",
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      final transaksi = TransactionModel(
                        category: selectedCategory,
                        amount: int.parse(amountController.text),
                        note: noteController.text,
                      );

                      widget.onAddTransaction(transaksi);

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Data berhasil disimpan"),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      "Simpan",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }

  InputDecoration _inputDecoration({String? label}) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Colors.white70),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          color: Colors.white24,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          color: Colors.deepPurple,
        ),
      ),
    );
  }
}
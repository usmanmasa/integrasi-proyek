import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final Map<String, int> _orderCount = {
    'Se\'i Sapi': 0,
    'Jagung Bose': 0,
    'Ikan Kuah Asam': 0,
    'Nasi Kuning NTT': 0,
  };

  void _increment(String foodName) {
    setState(() {
      _orderCount[foodName] = (_orderCount[foodName] ?? 0) + 1;
    });
  }

  void _decrement(String foodName) {
    setState(() {
      final current = _orderCount[foodName] ?? 0;
      if (current > 0) {
        _orderCount[foodName] = current - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pesan Makanan NTT'),
        backgroundColor: Colors.deepOrange,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
          const Text(
            'Pilih menu dan jumlah pesananmu',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 14),
          ..._orderCount.entries.map((entry) {
            return Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(entry.key, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 6),
                          Text('Jumlah: ${entry.value}', style: const TextStyle(fontSize: 14, color: Colors.black54)),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => _decrement(entry.key),
                          icon: const Icon(Icons.remove_circle_outline),
                        ),
                        IconButton(
                          onPressed: () => _increment(entry.key),
                          icon: const Icon(Icons.add_circle_outline),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange),
              onPressed: () {
                final totalOrders = _orderCount.values.fold<int>(0, (sum, count) => sum + count);
                showDialog<void>(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Pesanan berhasil'),
                      content: Text('Anda memesan $totalOrders item. Terima kasih!'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 14),
                child: Text('Konfirmasi Pesanan', style: TextStyle(fontSize: 16)),
              ),
            ),
          ),
        ],
        ),
      ),
    );
  }
}

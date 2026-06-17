import 'package:flutter/material.dart';
import '../models/food_item.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  final List<FoodItem> foods = [
    FoodItem(
      name: 'Se\'i Sapi',
      description: 'Daging asap khas NTT dengan aroma rempah alami.',
      imageUrl: 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?auto=format&fit=crop&w=800&q=80',
      price: 65000,
    ),
    FoodItem(
      name: 'Jagung Bose',
      description: 'Jagung manis NTT dimasak bersama kacang dan santan.',
      imageUrl: 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?auto=format&fit=crop&w=800&q=80',
      price: 30000,
    ),
    FoodItem(
      name: 'Ikan Kuah Asam',
      description: 'Ikan segar dengan kuah asam pedas khas pulau Flores.',
      imageUrl: 'https://images.unsplash.com/photo-1504674900247-0877df9cc836?auto=format&fit=crop&w=800&q=80',
      price: 48000,
    ),
    FoodItem(
      name: 'Nasi Kuning NTT',
      description: 'Nasi kuning dengan lauk tradisional khas NTT.',
      imageUrl: 'https://images.unsplash.com/photo-1543353071-087092ec393b?auto=format&fit=crop&w=800&q=80',
      price: 25000,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Makanan NTT'),
        backgroundColor: Colors.deepOrange,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Makanan Khas NTT',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final width = constraints.maxWidth;
                    int crossAxis = 2;
                    if (width >= 900) {
                      crossAxis = 4;
                    } else if (width >= 600) {
                      crossAxis = 3;
                    }
                    return GridView.builder(
                      itemCount: foods.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxis,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 0.95,
                      ),
                      itemBuilder: (context, index) {
                        final food = foods[index];
                        return FoodCard(food: food);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FoodCard extends StatelessWidget {
  final FoodItem food;

  const FoodCard({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              food.name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            Flexible(
              child: Text(
                food.description,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 12, color: Colors.black54),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Rp ${food.price}',
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}

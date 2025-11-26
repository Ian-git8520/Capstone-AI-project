// lib/screens/car_details_screen.dart

import 'package:flutter/material.dart';
import '../models/car.dart';
import '../utils/constants.dart';

class CarDetailsScreen extends StatelessWidget {
  final Car car;

  const CarDetailsScreen({
    super.key,
    required this.car,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(car.fullName),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Share feature coming soon!')),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${car.fullName} added to favorites!')),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main Image
            Container(
              height: 300,
              width: double.infinity,
              color: Colors.grey[200],
              child: Image.network(
                car.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: const Center(
                      child: Icon(
                        Icons.directions_car,
                        size: 80,
                        color: Colors.grey,
                      ),
                    ),
                  );
                },
              ),
            ),

            // Image Gallery (if available)
            if (car.galleryImages.isNotEmpty)
              Container(
                height: 80,
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  itemCount: car.galleryImages.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 80,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey[300]!),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          car.galleryImages[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),

            // Price & Title Section
            Container(
              padding: const EdgeInsets.all(AppConstants.paddingMedium),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              car.fullName,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${car.year} • ${car.category}',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          if (car.hasDiscount)
                            Text(
                              car.formattedOriginalPrice,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[500],
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          Text(
                            car.formattedPrice,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  if (car.hasDiscount)
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red[50],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Save ${car.discountPercentage.toStringAsFixed(0)}% - Special Offer!',
                        style: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  if (car.rating != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 20),
                          const SizedBox(width: 4),
                          Text(
                            car.rating!.toStringAsFixed(1),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '(${car.reviewCount} reviews)',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),

            const Divider(height: 1),

            // Specifications
            Padding(
              padding: const EdgeInsets.all(AppConstants.paddingMedium),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Specifications',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildSpecRow(Icons.local_gas_station, 'Fuel Type', car.fuelType),
                  _buildSpecRow(Icons.settings, 'Transmission', car.transmission),
                  _buildSpecRow(Icons.palette, 'Color', car.color),
                  _buildSpecRow(Icons.speed, 'Mileage', '${car.mileage} km'),
                  _buildSpecRow(Icons.engineering, 'Engine', car.engineSize),
                  _buildSpecRow(Icons.check_circle, 'Condition', car.condition),
                ],
              ),
            ),

            const Divider(height: 1),

            // Features
            Padding(
              padding: const EdgeInsets.all(AppConstants.paddingMedium),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Features',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: car.features.map((feature) {
                      return Chip(
                        label: Text(feature),
                        backgroundColor: Colors.blue[50],
                        labelStyle: TextStyle(color: Colors.blue[900]),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),

            // Description
            if (car.description.isNotEmpty) ...[
              const Divider(height: 1),
              Padding(
                padding: const EdgeInsets.all(AppConstants.paddingMedium),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      car.description,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[700],
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],

            // Dealer Info
            const Divider(height: 1),
            Padding(
              padding: const EdgeInsets.all(AppConstants.paddingMedium),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Dealer Information',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildInfoRow(Icons.store, car.dealerName),
                  _buildInfoRow(Icons.phone, car.dealerContact),
                  _buildInfoRow(Icons.location_on, car.dealerLocation),
                ],
              ),
            ),

            const SizedBox(height: 80), // Space for bottom button
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(AppConstants.paddingMedium),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Contact Dealer'),
                      content: Text(
                        'Call ${car.dealerName} at ${car.dealerContact} to schedule a test drive!',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Close'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Calling dealer...')),
                            );
                          },
                          child: const Text('Call Now'),
                        ),
                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.phone),
                label: const Text('Contact Dealer'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),
            const SizedBox(width: 12),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Test drive booking coming soon!')),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 14,
                ),
              ),
              child: const Text('Test Drive'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSpecRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey[600]),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey[600],
              ),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey[600]),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
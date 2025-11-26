// lib/screens/home_screen.dart

import 'package:flutter/material.dart';
import '../models/car.dart';
import '../data/cars_data.dart';
import '../widgets/car_card.dart';
import '../utils/constants.dart';
import 'car_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = 'All';
  String searchQuery = '';
  List<Car> filteredCars = [];

  @override
  void initState() {
    super.initState();
    filteredCars = sampleCars;
  }

  void _filterCars() {
    setState(() {
      filteredCars = sampleCars.where((car) {
        // Category filter
        final categoryMatch = selectedCategory == 'All' || 
                             car.category == selectedCategory;
        
        // Search filter
        final searchMatch = searchQuery.isEmpty ||
                           car.fullName.toLowerCase().contains(searchQuery.toLowerCase());
        
        return categoryMatch && searchMatch;
      }).toList();
    });
  }

  void _onCategorySelected(String category) {
    setState(() {
      selectedCategory = category;
      _filterCars();
    });
  }

  void _onSearchChanged(String query) {
    setState(() {
      searchQuery = query;
      _filterCars();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.appName),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Search Bar
          Container(
            padding: const EdgeInsets.all(AppConstants.paddingMedium),
            color: Theme.of(context).primaryColor,
            child: TextField(
              onChanged: _onSearchChanged,
              decoration: InputDecoration(
                hintText: 'Search cars...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.paddingMedium,
                  vertical: AppConstants.paddingSmall,
                ),
              ),
            ),
          ),

          // Category Filters
          Container(
            height: 60,
            padding: const EdgeInsets.symmetric(vertical: AppConstants.paddingSmall),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: AppConstants.paddingSmall),
              itemCount: AppConstants.categories.length,
              itemBuilder: (context, index) {
                final category = AppConstants.categories[index];
                final isSelected = category == selectedCategory;
                
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: ChoiceChip(
                    label: Text(category),
                    selected: isSelected,
                    onSelected: (_) => _onCategorySelected(category),
                    selectedColor: Theme.of(context).primaryColor,
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : Colors.black87,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                );
              },
            ),
          ),

          // Results count
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.paddingMedium,
              vertical: AppConstants.paddingSmall,
            ),
            child: Row(
              children: [
                Text(
                  '${filteredCars.length} cars available',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const Spacer(),
                if (searchQuery.isNotEmpty || selectedCategory != 'All')
                  TextButton.icon(
                    onPressed: () {
                      setState(() {
                        selectedCategory = 'All';
                        searchQuery = '';
                        _filterCars();
                      });
                    },
                    icon: const Icon(Icons.clear),
                    label: const Text('Clear'),
                  ),
              ],
            ),
          ),

          // Car Grid
          Expanded(
            child: filteredCars.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_off,
                          size: 64,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No cars found',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: Colors.grey[600],
                              ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Try adjusting your filters',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Colors.grey[500],
                              ),
                        ),
                      ],
                    ),
                  )
                : GridView.builder(
                    padding: const EdgeInsets.all(AppConstants.paddingMedium),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                      crossAxisSpacing: AppConstants.paddingMedium,
                      mainAxisSpacing: AppConstants.paddingMedium,
                    ),
                    itemCount: filteredCars.length,
                    itemBuilder: (context, index) {
                      final car = filteredCars[index];
                      return CarCard(
                        car: car,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CarDetailsScreen(car: car),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Show featured cars
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Featured Deals'),
              content: Text('${getFeaturedCars().length} featured cars available!'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Close'),
                ),
              ],
            ),
          );
        },
        child: const Icon(Icons.star),
      ),
    );
  }
}
// lib/data/cars_data.dart

import '../models/car.dart';

/// Sample car data for the dealership
final List<Car> sampleCars = [
  // 1. Luxury Sedan
  Car(
    id: '1',
    brand: 'Toyota',
    model: 'Camry',
    year: 2024,
    price: 3800000,
    discountPrice: 2650000,
    category: 'Sedan',
    fuelType: 'Hybrid',
    imageUrl: 'https://images.unsplash.com/photo-1621007947382-bb3c3994e3fb?w=800',
    galleryImages: [
      'https://images.unsplash.com/photo-1621007947382-bb3c3994e3fb?w=800',
      'https://images.unsplash.com/photo-1549317661-bd32c8ce0db2?w=800',
      'https://images.unsplash.com/photo-1542362567-b07e54358753?w=800',
    ],
    features: [
      'Leather Seats',
      'Sunroof',
      'Navigation System',
      'Backup Camera',
      'Bluetooth',
      'Apple CarPlay',
    ],
    description: 'The 2024 Toyota Camry combines reliability with modern luxury. '
        'Perfect for families and professionals who value comfort and efficiency.',
    transmission: 'Automatic',
    color: 'Pearl White',
    mileage: 15000,
    engineSize: '2.5L Hybrid',
    dealerName: 'Elite Auto Dealership',
    dealerContact: '+254-700-123456',
    dealerLocation: 'Westlands, Nairobi',
    isAvailable: true,
    isFeatured: true,
    rating: 4.8,
    reviewCount: 124,
  ),

  // 2. Family SUV
  Car(
    id: '2',
    brand: 'Honda',
    model: 'CR-V',
    year: 2023,
    price: 4500000,
    category: 'SUV',
    fuelType: 'Petrol',
    imageUrl: 'https://images.unsplash.com/photo-1619767886558-efdc259cde1a?w=800',
    galleryImages: [
      'https://images.unsplash.com/photo-1619767886558-efdc259cde1a?w=800',
    ],
    features: [
      'All-Wheel Drive',
      'Third Row Seating',
      'Adaptive Cruise Control',
      'Lane Keeping Assist',
      'Power Liftgate',
    ],
    description: 'Spacious and versatile SUV with excellent safety features. '
        'Ideal for growing families who need space and reliability.',
    transmission: 'CVT Automatic',
    color: 'Silver',
    mileage: 25000,
    engineSize: '1.5L Turbo',
    dealerName: 'Elite Auto Dealership',
    dealerContact: '+254-700-123456',
    dealerLocation: 'Karen, Nairobi',
    isAvailable: true,
    isFeatured: false,
    rating: 4.6,
    reviewCount: 89,
  ),

  // 3. Luxury SUV
  Car(
    id: '3',
    brand: 'BMW',
    model: 'M5',
    year: 2024,
    price: 9500000,
    discountPrice: 7950000,
    category: 'SUV',
    fuelType: 'Diesel',
    imageUrl: 'https://images.unsplash.com/photo-1555215695-3004980ad54e?w=800',
    galleryImages: [
      'https://images.unsplash.com/photo-1555215695-3004980ad54e?w=800',
      'https://images.unsplash.com/photo-1617531653520-bd466ad8ccf9?w=800',
    ],
    features: [
      'Premium Sound System',
      'Panoramic Sunroof',
      'Sport Package',
      'Heated Seats',
      'Head-Up Display',
      'Massage Function',
    ],
    description: 'Ultimate luxury SUV with cutting-edge technology and performance. '
        'Experience German engineering at its finest.',
    transmission: 'Automatic 8-Speed',
    color: 'Black',
    mileage: 8000,
    engineSize: '3.0L Diesel',
    dealerName: 'Elite Auto Dealership',
    dealerContact: '+254-700-123456',
    dealerLocation: 'Gigiri, Nairobi',
    isAvailable: true,
    isFeatured: true,
    rating: 4.9,
    reviewCount: 156,
  ),

  // 4. Electric Vehicle
  Car(
    id: '4',
    brand: 'Tesla',
    model: 'Model 3',
    year: 2024,
    price: 12200000,
    category: 'Electric',
    fuelType: 'Electric',
    imageUrl: 'https://images.unsplash.com/photo-1560958089-b8a1929cea89?w=800',
    galleryImages: [
      'https://images.unsplash.com/photo-1560958089-b8a1929cea89?w=800',
    ],
    features: [
      'Autopilot',
      'Long Range Battery (500km)',
      '0-100 in 3.3s',
      'Premium Interior',
      'Over-the-Air Updates',
      'Full Self-Driving Capable',
    ],
    description: 'The future of driving is here. Zero emissions, maximum performance, '
        'and cutting-edge autonomous technology.',
    transmission: 'Single-Speed Automatic',
    color: 'Midnight Silver',
    mileage: 5000,
    engineSize: 'Dual Motor AWD',
    dealerName: 'Elite Auto Dealership',
    dealerContact: '+254-700-123456',
    dealerLocation: 'Westlands, Nairobi',
    isAvailable: true,
    isFeatured: true,
    rating: 4.7,
    reviewCount: 203,
  ),

  // 5. Sports Car
  Car(
    id: '5',
    brand: 'Lamborghini',
    model: 'Avanterdor',
    year: 2024,
    price: 44500000,
    category: 'Sports',
    fuelType: 'Petrol',
    imageUrl: 'https://images.unsplash.com/photo-1544829099-b9a0c07fad1a?w=800',
    galleryImages: [
      'https://images.unsplash.com/photo-1544829099-b9a0c07fad1a?w=800',
    ],
    features: [
      'Convertible Soft Top',
      'Sport Suspension',
      'Bose Sound System',
      'Manual Transmission',
      'Limited Slip Differential',
    ],
    description: 'Pure driving pleasure in a lightweight roadster. '
        'Feel the wind in your hair and the road beneath you.',
    transmission: 'Manual 6-Speed',
    color: 'Soul Red',
    mileage: 3000,
    engineSize: '2.0L',
    dealerName: 'Elite Auto Dealership',
    dealerContact: '+254-700-123456',
    dealerLocation: 'Kilimani, Nairobi',
    isAvailable: true,
    isFeatured: false,
    rating: 4.5,
    reviewCount: 67,
  ),

  // 6. Affordable Compact
  Car(
    id: '6',
    brand: 'Ferrari',
    model: 'Spider',
    year: 2023,
    price: 33800000,
    category: 'Sports',
    fuelType: 'Petrol',
    imageUrl: 'https://images.unsplash.com/photo-1583121274602-3e2820c69888?w=800',
    galleryImages: [],
    features: [
      'Fuel Efficient',
      'Air Conditioning',
      'USB Ports',
      'Reverse Camera',
    ],
    description: 'Affordable and reliable compact car perfect for city driving. '
        'Great fuel economy and easy to park.',
    transmission: 'Manual',
    color: 'Red',
    mileage: 45000,
    engineSize: '1.2L',
    dealerName: 'Elite Auto Dealership',
    dealerContact: '+254-700-123456',
    dealerLocation: 'Industrial Area, Nairobi',
    isAvailable: true,
    isFeatured: false,
    rating: 4.3,
    reviewCount: 45,
  ),

  // 7. Pickup Truck
  Car(
    id: '7',
    brand: 'Ford',
    model: 'Grander',
    year: 2024,
    price: 5500000,
    category: 'Truck',
    fuelType: 'Diesel',
    imageUrl: 'https://images.unsplash.com/photo-1533473359331-0135ef1b58bf?w=800',
    galleryImages: [
      'https://images.unsplash.com/photo-1533473359331-0135ef1b58bf?w=800',
    ],
    features: [
      '4x4 Off-Road',
      'Towing Capacity 3500kg',
      'Hill Descent Control',
      'Skid Plates',
      'Differential Lock',
    ],
    description: 'Tough and capable pickup truck built for both work and adventure. '
        'Conquer any terrain with confidence.',
    transmission: 'Automatic 10-Speed',
    color: 'Grey',
    mileage: 12000,
    engineSize: '2.0L Bi-Turbo',
    dealerName: 'Elite Auto Dealership',
    dealerContact: '+254-700-123456',
    dealerLocation: 'Mombasa Road, Nairobi',
    isAvailable: true,
    isFeatured: false,
    rating: 4.4,
    reviewCount: 78,
  ),
];

/// Get cars by category
List<Car> getCarsByCategory(String category) {
  if (category == 'All') return sampleCars;
  return sampleCars.where((car) => car.category == category).toList();
}

/// Get featured cars
List<Car> getFeaturedCars() {
  return sampleCars.where((car) => car.isFeatured).toList();
}

/// Get cars with discounts
List<Car> getDiscountedCars() {
  return sampleCars.where((car) => car.hasDiscount).toList();
}

/// Search cars by query
List<Car> searchCars(String query) {
  final lowerQuery = query.toLowerCase();
  return sampleCars.where((car) {
    return car.brand.toLowerCase().contains(lowerQuery) ||
           car.model.toLowerCase().contains(lowerQuery) ||
           car.fullName.toLowerCase().contains(lowerQuery);
  }).toList();
}

/// Get available categories
List<String> getCategories() {
  return ['All', 'Sedan', 'SUV', 'Sports', 'Electric', 'Truck'];
}
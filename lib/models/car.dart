// lib/models/car.dart

/// Represents a car in the dealership inventory
class Car {
  // Basic Information
  final String id;
  final String brand;
  final String model;
  final int year;
  
  // Pricing
  final double price;
  final double? discountPrice; // Optional discounted price
  
  // Category & Type
  final String category; // Sedan, SUV, Sports, Electric, Truck
  final String fuelType; // Petrol, Diesel, Electric, Hybrid
  
  // Media
  final String imageUrl;
  final List<String> galleryImages; // Multiple images for car details
  
  // Specifications
  final List<String> features; // e.g., ['Leather Seats', 'Sunroof']
  final String description;
  
  // Technical Details
  final String transmission; // Automatic, Manual
  final String color;
  final int mileage; // in km or miles
  final String engineSize; // e.g., '2.0L', '3.5L V6'
  
  // Dealer Information
  final String dealerName;
  final String dealerContact;
  final String dealerLocation;
  
  // Status
  final bool isAvailable;
  final bool isFeatured; // For highlighting special deals
  
  // Ratings (optional)
  final double? rating; // 0.0 to 5.0
  final int? reviewCount;

  /// Constructor with required and optional parameters
  Car({
    required this.id,
    required this.brand,
    required this.model,
    required this.year,
    required this.price,
    required this.category,
    required this.imageUrl,
    required this.features,
    this.discountPrice,
    this.fuelType = 'Petrol',
    this.galleryImages = const [],
    this.description = '',
    this.transmission = 'Automatic',
    this.color = 'Black',
    this.mileage = 0,
    this.engineSize = '2.0L',
    this.dealerName = 'Elite Auto Dealership',
    this.dealerContact = '+254-700-123456',
    this.dealerLocation = 'Nairobi, Kenya',
    this.isAvailable = true,
    this.isFeatured = false,
    this.rating,
    this.reviewCount,
  });

  /// Get the full name of the car (Brand + Model)
  String get fullName => '$brand $model';

  /// Get the display year with model
  String get yearModel => '$year $brand $model';

  /// Check if car has a discount
  bool get hasDiscount => discountPrice != null && discountPrice! < price;

  /// Calculate discount percentage
  double get discountPercentage {
    if (!hasDiscount) return 0.0;
    return ((price - discountPrice!) / price * 100);
  }

  /// Get the effective price (discounted or regular)
  double get effectivePrice => discountPrice ?? price;

  /// Format price with currency symbol
  String get formattedPrice => 'KSh ${_formatNumber(effectivePrice)}';

  /// Format original price with currency symbol
  String get formattedOriginalPrice => 'KSh ${_formatNumber(price)}';

  /// Check if car is new (current year or last year)
  bool get isNew {
    final currentYear = DateTime.now().year;
    return year >= currentYear - 1;
  }

  /// Get condition text
  String get condition => isNew ? 'New' : 'Used';

  /// Helper method to format numbers with commas
  String _formatNumber(double number) {
    return number.toStringAsFixed(0).replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match match) => '${match[1]},',
    );
  }

  /// Create a copy of the car with updated fields
  Car copyWith({
    String? id,
    String? brand,
    String? model,
    int? year,
    double? price,
    double? discountPrice,
    String? category,
    String? fuelType,
    String? imageUrl,
    List<String>? galleryImages,
    List<String>? features,
    String? description,
    String? transmission,
    String? color,
    int? mileage,
    String? engineSize,
    String? dealerName,
    String? dealerContact,
    String? dealerLocation,
    bool? isAvailable,
    bool? isFeatured,
    double? rating,
    int? reviewCount,
  }) {
    return Car(
      id: id ?? this.id,
      brand: brand ?? this.brand,
      model: model ?? this.model,
      year: year ?? this.year,
      price: price ?? this.price,
      discountPrice: discountPrice ?? this.discountPrice,
      category: category ?? this.category,
      fuelType: fuelType ?? this.fuelType,
      imageUrl: imageUrl ?? this.imageUrl,
      galleryImages: galleryImages ?? this.galleryImages,
      features: features ?? this.features,
      description: description ?? this.description,
      transmission: transmission ?? this.transmission,
      color: color ?? this.color,
      mileage: mileage ?? this.mileage,
      engineSize: engineSize ?? this.engineSize,
      dealerName: dealerName ?? this.dealerName,
      dealerContact: dealerContact ?? this.dealerContact,
      dealerLocation: dealerLocation ?? this.dealerLocation,
      isAvailable: isAvailable ?? this.isAvailable,
      isFeatured: isFeatured ?? this.isFeatured,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
    );
  }

  /// Convert Car to JSON (useful for API or local storage)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'brand': brand,
      'model': model,
      'year': year,
      'price': price,
      'discountPrice': discountPrice,
      'category': category,
      'fuelType': fuelType,
      'imageUrl': imageUrl,
      'galleryImages': galleryImages,
      'features': features,
      'description': description,
      'transmission': transmission,
      'color': color,
      'mileage': mileage,
      'engineSize': engineSize,
      'dealerName': dealerName,
      'dealerContact': dealerContact,
      'dealerLocation': dealerLocation,
      'isAvailable': isAvailable,
      'isFeatured': isFeatured,
      'rating': rating,
      'reviewCount': reviewCount,
    };
  }

  /// Create Car from JSON (useful for API or local storage)
  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      id: json['id'] as String,
      brand: json['brand'] as String,
      model: json['model'] as String,
      year: json['year'] as int,
      price: (json['price'] as num).toDouble(),
      discountPrice: json['discountPrice'] != null 
          ? (json['discountPrice'] as num).toDouble() 
          : null,
      category: json['category'] as String,
      fuelType: json['fuelType'] as String? ?? 'Petrol',
      imageUrl: json['imageUrl'] as String,
      galleryImages: json['galleryImages'] != null
          ? List<String>.from(json['galleryImages'])
          : [],
      features: List<String>.from(json['features']),
      description: json['description'] as String? ?? '',
      transmission: json['transmission'] as String? ?? 'Automatic',
      color: json['color'] as String? ?? 'Black',
      mileage: json['mileage'] as int? ?? 0,
      engineSize: json['engineSize'] as String? ?? '2.0L',
      dealerName: json['dealerName'] as String? ?? 'Elite Auto Dealership',
      dealerContact: json['dealerContact'] as String? ?? '+254-700-123456',
      dealerLocation: json['dealerLocation'] as String? ?? 'Nairobi, Kenya',
      isAvailable: json['isAvailable'] as bool? ?? true,
      isFeatured: json['isFeatured'] as bool? ?? false,
      rating: json['rating'] != null ? (json['rating'] as num).toDouble() : null,
      reviewCount: json['reviewCount'] as int?,
    );
  }

  /// String representation for debugging
  @override
  String toString() {
    return 'Car(id: $id, brand: $brand, model: $model, year: $year, price: $price)';
  }

  /// Equality comparison
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Car && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
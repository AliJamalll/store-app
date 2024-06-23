class ProductsModel {
  final dynamic id;
  final String title;
  final double price; // Changed from String to double
  final String description;
  final String category;
  final String image;
  final RatingModel rating;

  ProductsModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> jsonData) {
    return ProductsModel(
      id: jsonData['id'],
      title: jsonData['title'],
      price: double.tryParse(jsonData['price'].toString()) ?? 0.0, // Convert price to double
      description: jsonData['description'],
      category: jsonData['category'],
      image: jsonData['image'],
      rating: RatingModel.fromJson(jsonData['rating']),
    );
  }
}

class RatingModel {
  final double rate;
  final int count;

  RatingModel({required this.rate, required this.count});

  factory RatingModel.fromJson(Map<String, dynamic> jsonData) {
    return RatingModel(
      rate: jsonData['rate'].toDouble(), // Ensure conversion to double
      count: jsonData['count'],
    );
  }
}

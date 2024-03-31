class Product {
  final int id;
  final String title;
  final num price;
  final String description;
  final String image;
  final String category;
  final Rating? rating;

  const Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.category,
    required this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      image: json['image'],
      category: json['category'],
      rating: json['rating'] == null ? null : Rating.fromJson(json['rating']),
    );
  }
}

class Rating {
  final num rate;
  final int count;

  const Rating({
    required this.rate,
    required this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate: json['rate'],
      count: json['count'],
    );
  }
}

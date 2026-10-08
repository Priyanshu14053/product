class Product {
  final int albumId;
  final int id;
  final String name;
  final String imageUrl;
  final String thumbnailUrl;

  Product({
    required this.albumId,
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.thumbnailUrl,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      albumId: json['albumId'] ?? 0,
      id: json['id'] ?? 0,
      name: json['title'] ?? '',
      imageUrl: json['url'] ?? '',
      thumbnailUrl: json['thumbnailUrl'] ?? '',
    );
  }
}
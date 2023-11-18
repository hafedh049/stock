import 'package:stock/models/product_model.dart';

class Category {
  List<Product> products;
  String category;
  List<int> categoryImage;
  int numberOfProducts;
  List<String> brands;

  Category({required this.products, required this.category, required this.categoryImage, required this.numberOfProducts, required this.brands});

  factory Category.fromJson(Map<String, dynamic> json) {
    List<Product> products = (json['products'] as List<dynamic>).map((productJson) => Product.fromJson(productJson)).toList();

    return Category(
      products: products,
      category: json['category'],
      categoryImage: List<int>.from(json['category_image']),
      numberOfProducts: json['number_of_products'],
      brands: List<String>.from(json['brands']),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'products': products.map((Product product) => product.toJson()).toList(),
      'category': category,
      'category_image': categoryImage,
      'number_of_products': numberOfProducts,
      'brands': brands,
    };
  }
}

class Product {
  String productId;
  String productName;
  String productDescription;
  int productPrice;
  int productSellPrice;
  List<int> productPicture = <int>[];
  List<List<int>> productPictures;
  int productSeuil;
  int productQuantity;
  int productDiscount;
  String productStatus;
  String productDate;
  String productCategory;
  String productBrand;
  String productSku;
  String productUpcA;
  String productEan;
  String productIsbn;
  String productCurrency;
  ProductMetadata productMetadata;

  Product({
    required this.productId,
    required this.productName,
    required this.productDescription,
    required this.productPrice,
    required this.productSellPrice,
    required this.productPictures,
    required this.productSeuil,
    required this.productQuantity,
    required this.productDiscount,
    required this.productStatus,
    required this.productDate,
    required this.productCategory,
    required this.productBrand,
    required this.productSku,
    required this.productUpcA,
    required this.productEan,
    required this.productIsbn,
    required this.productCurrency,
    required this.productMetadata,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productId: json['product_id'],
      productName: json['product_name'],
      productDescription: json['product_description'],
      productPrice: json['product_price'],
      productSellPrice: json['product_sell_price'],
      productPictures: (json['product_pictures'] as List<dynamic>).map<List<int>>((dynamic picture) => (picture as List<dynamic>).cast<int>()).toList(),
      productSeuil: json['product_seuil'],
      productQuantity: json['product_quantity'],
      productDiscount: json['product_discount'],
      productStatus: json['product_status'],
      productDate: json['product_date'],
      productCategory: json['product_category'],
      productBrand: json['product_brand'],
      productSku: json['product_sku'],
      productUpcA: json['product_upc_a'],
      productEan: json['product_ean'],
      productIsbn: json['product_isbn'],
      productCurrency: json['product_currency'],
      productMetadata: ProductMetadata.fromJson(json['product_metadata'] ?? <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'product_id': productId,
      'product_name': productName,
      'product_description': productDescription,
      'product_price': productPrice,
      'product_sell_price': productSellPrice,
      'product_pictures': productPictures,
      'product_seuil': productSeuil,
      'product_quantity': productQuantity,
      'product_discount': productDiscount,
      'product_status': productStatus,
      'product_date': productDate,
      'product_category': productCategory,
      'product_brand': productBrand,
      'product_sku': productSku,
      'product_upc_a': productUpcA,
      'product_ean': productEan,
      'product_isbn': productIsbn,
      'product_currency': productCurrency,
      'product_metadata': productMetadata.toJson(),
    };
  }
}

class ProductMetadata {
  String size;
  String color;
  int weight;
  Dimensions dimensions;
  String material;
  String style;
  List<String> variants;
  List<String> productFeatures;
  List<String> productSpecifications;
  ReviewsAndRatings reviewsAndRatings;
  List<String> relatedProducts;
  List<String> crossSellOrUpSellProducts;

  ProductMetadata({
    required this.size,
    required this.color,
    required this.weight,
    required this.dimensions,
    required this.material,
    required this.style,
    required this.variants,
    required this.productFeatures,
    required this.productSpecifications,
    required this.reviewsAndRatings,
    required this.relatedProducts,
    required this.crossSellOrUpSellProducts,
  });

  factory ProductMetadata.fromJson(Map<String, dynamic> json) {
    return ProductMetadata(
      size: json['size'],
      color: json['color'],
      weight: json['weight'],
      dimensions: Dimensions.fromJson(json['dimensions'] ?? <String, dynamic>{}),
      material: json['material'],
      style: json['style'],
      variants: (json['variants'] as List<dynamic>).cast<String>(),
      productFeatures: (json['product_features'] as List<dynamic>).cast<String>(),
      productSpecifications: (json['product_specifications'] as List<dynamic>).cast<String>(),
      reviewsAndRatings: ReviewsAndRatings.fromJson(json['reviews_and_ratings'] ?? <String, dynamic>{}),
      relatedProducts: (json['related_products'] as List<dynamic>).cast<String>(),
      crossSellOrUpSellProducts: (json['cross-sell_or_up-sell_products'] as List<dynamic>).cast<String>(),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'size': size,
      'color': color,
      'weight': weight,
      'dimensions': dimensions.toJson(),
      'material': material,
      'style': style,
      'variants': variants,
      'product_features': productFeatures,
      'product_specifications': productSpecifications,
      'reviews_and_ratings': reviewsAndRatings.toJson(),
      'related_products': relatedProducts,
      'cross-sell_or_up-sell_products': crossSellOrUpSellProducts,
    };
  }
}

class Dimensions {
  int length;
  int width;
  int height;

  Dimensions({required this.length, required this.width, required this.height});

  factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(length: json['length'], width: json['width'], height: json['height']);

  Map<String, dynamic> toJson() => <String, int>{'length': length, 'width': width, 'height': height};
}

class ReviewsAndRatings {
  double averageRating;
  int numberOfReviews;

  ReviewsAndRatings({required this.averageRating, required this.numberOfReviews});

  factory ReviewsAndRatings.fromJson(Map<String, dynamic> json) => ReviewsAndRatings(averageRating: json['average_rating'], numberOfReviews: json['number_of_reviews']);

  Map<String, dynamic> toJson() => <String, dynamic>{'average_rating': averageRating, 'number_of_reviews': numberOfReviews};
}

class Product {
  String productId;
  String productName;
  String productDescription;
  int productPrice;
  int productSellPrice;
  List<String> productPicture;
  int seuil;
  int productQuantity;
  int productDiscount;
  String productStatus;
  String productDate;
  String productCategory;
  String productBrand;

  Product({
    required this.productId,
    required this.productName,
    required this.productDescription,
    required this.productPrice,
    required this.productSellPrice,
    required this.productPicture,
    required this.seuil,
    required this.productQuantity,
    required this.productDiscount,
    required this.productStatus,
    required this.productDate,
    required this.productCategory,
    required this.productBrand,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productId: json['product_id'],
      productName: json['product_name'],
      productDescription: json['product_description'],
      productPrice: json['product_price'],
      productSellPrice: json['product_sell_price'],
      productPicture: List<String>.from(json['product_picture']),
      seuil: json['seuil'],
      productQuantity: json['product_quantity'], // Fixed typo in 'product_quantity'
      productDiscount: json['product_discount'],
      productStatus: json['product_status'],
      productDate: json['product_date'],
      productCategory: json['product_category'],
      productBrand: json['product_brand'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'product_id': productId,
      'product_name': productName,
      'product_description': productDescription,
      'product_price': productPrice,
      'product_sell_price': productSellPrice,
      'product_picture': productPicture,
      'seuil': seuil,
      'product_quantity': productQuantity, // Fixed typo in 'product_quantity'
      'product_discount': productDiscount,
      'product_status': productStatus,
      'product_date': productDate,
      'product_category': productCategory,
      'product_brand': productBrand,
    };
  }

  get values => toJson().keys.where((value) => !<String>['product_description', 'product_price', 'product_picture'].contains(value)).map((e) => toJson()[e]).toList();
}

class Product {
  String productId;
  String productName;
  String productDescription;
  int productPrice;
  int productSellPrice;
  List<List<int>> productPictures;
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
    required this.productPictures,
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
      productPictures: List<List<int>>.from(json['product_pictures']),
      seuil: json['product_seuil'],
      productQuantity: json['product_quantity'],
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
      'product_pictures': productPictures,
      'product_seuil': seuil,
      'product_quantity': productQuantity,
      'product_discount': productDiscount,
      'product_status': productStatus,
      'product_date': productDate,
      'product_category': productCategory,
      'product_brand': productBrand,
    };
  }
}

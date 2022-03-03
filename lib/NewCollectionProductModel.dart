// To parse this JSON data, do
//
//     final newCollectionProductModel = newCollectionProductModelFromJson(jsonString);

import 'dart:convert';

NewCollectionProductModel newCollectionProductModelFromJson(String str) =>
    NewCollectionProductModel.fromJson(json.decode(str));

String newCollectionProductModelToJson(NewCollectionProductModel data) =>
    json.encode(data.toJson());

class NewCollectionProductModel {
  NewCollectionProductModel({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
    required this.total,
  });

  final int currentPage;
  final List<Datum> data;
  final String firstPageUrl;
  final int from;
  final int lastPage;
  final String lastPageUrl;
  final String nextPageUrl;
  final String path;
  final int perPage;
  final dynamic prevPageUrl;
  final int to;
  final int total;

  factory NewCollectionProductModel.fromJson(Map<String, dynamic> json) =>
      NewCollectionProductModel(
        currentPage: json["current_page"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.price,
    required this.salePrice,
    required this.slug,
    required this.discount,
    required this.thumnail,
    required this.productImage,
  });

  final int id;
  final String name;
  final String price;
  final String salePrice;
  final String slug;
  final int discount;
  final String thumnail;
  final List<ProductImage> productImage;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        salePrice: json["sale_price"],
        slug: json["slug"],
        discount: json["discount"],
        thumnail: json["thumnail"],
        productImage: List<ProductImage>.from(
            json["product_image"].map((x) => ProductImage.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "sale_price": salePrice,
        "slug": slug,
        "discount": discount,
        "thumnail": thumnail,
        "product_image":
            List<dynamic>.from(productImage.map((x) => x.toJson())),
      };
}

class ProductImage {
  ProductImage({
    required this.id,
    required this.productId,
    required this.productImage,
    required this.createdAt,
    required this.prefixUrl,
    required this.updatedAt,
  });

  final int id;
  final int productId;
  final String productImage;
  final DateTime createdAt;
  final String prefixUrl;
  final DateTime updatedAt;

  factory ProductImage.fromJson(Map<String, dynamic> json) => ProductImage(
        id: json["id"],
        productId: json["product_id"],
        productImage: json["product_image"],
        createdAt: DateTime.parse(json["created_at"]),
        prefixUrl: json["prefix_url"],
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "product_image": productImage,
        "created_at": createdAt.toIso8601String(),
        "prefix_url": prefixUrl,
        "updated_at": updatedAt.toIso8601String(),
      };
}

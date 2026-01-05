import '../../domain/entities/deal.dart';

class DealModel extends Deal {
  const DealModel({
    required super.id,
    required super.title,
    required super.subTitle,
    required super.description,
    required super.imageUrl,
    required super.originalPrice,
    required super.discountPrice,
    required super.expiryDate,
    required super.location,
    required super.promotionId,
    super.isFeatured,
    super.isNew,
    super.isExpiringSoon,
  });

  factory DealModel.fromJson(Map<String, dynamic> json) {
    return DealModel(
      id: json['id'],
      title: json['title'],
      subTitle: json['subTitle'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      originalPrice: (json['originalPrice'] as num).toDouble(),
      discountPrice: (json['discountPrice'] as num).toDouble(),
      expiryDate: json['expiryDate'],
      location: json['location'],
      promotionId: json['promotionId'],
      isFeatured: json['isFeatured'] ?? false,
      isNew: json['isNew'] ?? false,
      isExpiringSoon: json['isExpiringSoon'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'subTitle': subTitle,
      'description': description,
      'imageUrl': imageUrl,
      'originalPrice': originalPrice,
      'discountPrice': discountPrice,
      'expiryDate': expiryDate,
      'location': location,
      'promotionId': promotionId,
      'isFeatured': isFeatured,
      'isNew': isNew,
      'isExpiringSoon': isExpiringSoon,
    };
  }
}

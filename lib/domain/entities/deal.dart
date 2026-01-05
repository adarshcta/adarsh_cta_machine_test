import 'package:equatable/equatable.dart';

class Deal extends Equatable {
  final String id;
  final String title;
  final String subTitle;
  final String description;
  final String imageUrl;
  final double originalPrice;
  final double discountPrice;
  final String expiryDate;
  final String location;
  final String promotionId;
  final bool isFeatured;
  final bool isNew;
  final bool isExpiringSoon;

  const Deal({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.description,
    required this.imageUrl,
    required this.originalPrice,
    required this.discountPrice,
    required this.expiryDate,
    required this.location,
    required this.promotionId,
    this.isFeatured = false,
    this.isNew = false,
    this.isExpiringSoon = false,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    subTitle,
    description,
    imageUrl,
    originalPrice,
    discountPrice,
    expiryDate,
    location,
    promotionId,
    isFeatured,
    isNew,
    isExpiringSoon,
  ];
}

import '../models/deal_model.dart';
import '../../core/utils/constants.dart';

abstract class LocalDataSource {
  Future<List<DealModel>> getDeals();
  Future<DealModel> getDealDetails(String id);
}

class LocalDataSourceImpl implements LocalDataSource {
  @override
  Future<List<DealModel>> getDeals() async {
    // Simulating delay
    await Future.delayed(const Duration(milliseconds: 500));
    return _mockDeals;
  }

  @override
  Future<DealModel> getDealDetails(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _mockDeals.firstWhere((element) => element.id == id);
  }

  final List<DealModel> _mockDeals = [
    const DealModel(
      id: '1',
      title: 'Glow up to 15% Off',
      subTitle: 'VLCC Qatar',
      description: 'Step into a world of confidence and care with VLCC.',
      imageUrl:
          'assets/deal_vlcc_final.png', 
      originalPrice: 200,
      discountPrice: 170,
      expiryDate: 'Oct 30, 2025',
      location: 'Available at all VLCC outlets in Qatar',
      promotionId: '#6589',
      isNew: true,
      isFeatured: true,
    ),
    const DealModel(
      id: '2',
      title: 'Free Delivery',
      subTitle: 'Snoonu',
      description:
          'Meet your one-stop solution for shopping, dining, and convenience Snoonu.',
      imageUrl: 'assets/Rectangle 3111.png', // Bike guy
      originalPrice: 50,
      discountPrice: 0,
      expiryDate: 'Oct 30, 2025',
      location: 'Doha, Qatar',
      promotionId: '#6590',
      isExpiringSoon: true,
      isFeatured: true,
    ),
    const DealModel(
      id: '3',
      title: 'Enjoy 15% Off',
      subTitle: 'STK Doha',
      description:
          'Dining experience at STK Doha, a bold reimagining of the American steakhouse.',
      imageUrl: 'assets/Rectangle 3133.png', // Food
      originalPrice: 400,
      discountPrice: 340,
      expiryDate: 'Oct 30, 2025',
      location: 'STK Doha',
      promotionId: '#6591',
      isNew: true,
      isFeatured: true,
    ),
    const DealModel(
      id: '4',
      title: 'Dive into fun at QAR 155',
      subTitle: 'Meryal Water Park',
      description:
          'The region\'s largest waterpark and home to record-breaking rides and attractions.',
      imageUrl: 'assets/Rectangle 3109.png', // Waterpark
      originalPrice: 200,
      discountPrice: 155,
      expiryDate: 'Oct 30, 2025',
      location: 'Lusail',
      promotionId: '#6592',
      isNew: true,
      isFeatured: true,
    ),
  ];
}

import 'package:flutter/material.dart';
import '../../core/usecases/usecase.dart';
import '../../domain/entities/deal.dart';
import '../../domain/usecases/get_deal_details.dart';
import '../../domain/usecases/get_deals.dart';

class DealProvider with ChangeNotifier {
  final GetDeals getDeals;
  final GetDealDetails getDealDetails;

  DealProvider({required this.getDeals, required this.getDealDetails});

  List<Deal> _deals = [];
  List<Deal> get deals => _deals;

  Deal? _selectedDeal;
  Deal? get selectedDeal => _selectedDeal;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> fetchDeals() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    final result = await getDeals(NoParams());

    result.fold(
      (failure) {
        _errorMessage = failure.message;
        _isLoading = false;
        notifyListeners();
      },
      (dealsData) {
        _deals = dealsData;
        _isLoading = false;
        notifyListeners();
      },
    );
  }

  Future<void> fetchDealDetails(String id) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    final result = await getDealDetails(id);

    result.fold(
      (failure) {
        _errorMessage = failure.message;
        _isLoading = false;
        notifyListeners();
      },
      (deal) {
        _selectedDeal = deal;
        _isLoading = false;
        notifyListeners();
      },
    );
  }
}

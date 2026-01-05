import 'package:dartz/dartz.dart';
import '../../core/error/failures.dart';
import '../../core/usecases/usecase.dart';
import '../entities/deal.dart';
import '../repositories/deal_repository.dart';

class GetDealDetails implements UseCase<Deal, String> {
  final DealRepository repository;

  GetDealDetails(this.repository);

  @override
  Future<Either<Failure, Deal>> call(String params) async {
    return await repository.getDealDetails(params);
  }
}

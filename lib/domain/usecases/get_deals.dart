import 'package:dartz/dartz.dart';
import '../../core/error/failures.dart';
import '../../core/usecases/usecase.dart';
import '../entities/deal.dart';
import '../repositories/deal_repository.dart';

class GetDeals implements UseCase<List<Deal>, NoParams> {
  final DealRepository repository;

  GetDeals(this.repository);

  @override
  Future<Either<Failure, List<Deal>>> call(NoParams params) async {
    return await repository.getDeals();
  }
}

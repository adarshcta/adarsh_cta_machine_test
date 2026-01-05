import 'package:dartz/dartz.dart';
import '../../core/error/failures.dart';
import '../../domain/entities/deal.dart';
import '../../domain/repositories/deal_repository.dart';
import '../datasources/local_data_source.dart';

class DealRepositoryImpl implements DealRepository {
  final LocalDataSource localDataSource;

  DealRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, List<Deal>>> getDeals() async {
    try {
      final deals = await localDataSource.getDeals();
      return Right(deals);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Deal>> getDealDetails(String id) async {
    try {
      final deal = await localDataSource.getDealDetails(id);
      return Right(deal);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }
}

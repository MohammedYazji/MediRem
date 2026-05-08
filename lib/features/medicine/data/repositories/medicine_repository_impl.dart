import 'package:dartz/dartz.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/medicine.dart';
import '../../domain/repositories/medicine_repository.dart';
import '../datasources/medicine_local_datasource.dart';
import '../models/medicine_model.dart';

class MedicineRepositoryImpl implements MedicineRepository {
  final MedicineLocalDataSource localDataSource;
  MedicineRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, List<Medicine>>> getMedicines() async {
    try {
      final models = await localDataSource.getMedicines();
      return Right(models.map((m) => m.toEntity()).toList());
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, Unit>> addMedicine(Medicine medicine) async {
    try {
      await localDataSource.addMedicine(MedicineModel.fromEntity(medicine));
      return const Right(unit);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteMedicine(String id) async {
    try {
      await localDataSource.deleteMedicine(id);
      return const Right(unit);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, Unit>> toggleMedicine(String id, bool isActive) async {
    try {
      await localDataSource.toggleMedicine(id, isActive);
      return const Right(unit);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }
}

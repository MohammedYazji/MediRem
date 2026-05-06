import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/medicine.dart';

/// Abstract contract — the data layer must implement this.
/// The domain layer never knows HOW data is stored.
abstract class MedicineRepository {
  Future<Either<Failure, List<Medicine>>> getMedicines();
  Future<Either<Failure, Unit>> addMedicine(Medicine medicine);
  Future<Either<Failure, Unit>> deleteMedicine(String id);
  Future<Either<Failure, Unit>> toggleMedicine(String id, bool isActive);
}

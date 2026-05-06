import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/medicine.dart';
import '../repositories/medicine_repository.dart';

class GetMedicines extends UseCase<List<Medicine>, NoParams> {
  final MedicineRepository repository;
  GetMedicines(this.repository);

  @override
  Future<Either<Failure, List<Medicine>>> call(NoParams params) {
    return repository.getMedicines();
  }
}

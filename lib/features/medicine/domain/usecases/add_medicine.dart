import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/medicine.dart';
import '../repositories/medicine_repository.dart';

class AddMedicine extends UseCase<Unit, AddMedicineParams> {
  final MedicineRepository repository;
  // shorthand constructor in dart
  AddMedicine(this.repository);

  // for adding medicine the param will be object of medicine
  @override
  Future<Either<Failure, Unit>> call(AddMedicineParams params) {
    return repository.addMedicine(params.medicine);
  }
}

class AddMedicineParams extends Equatable {
  final Medicine medicine;
  // shorthand constructor in dart
  const AddMedicineParams({required this.medicine});

  @override
  List<Object> get props => [medicine];
}

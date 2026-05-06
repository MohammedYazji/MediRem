import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/medicine_repository.dart';

class DeleteMedicine extends UseCase<Unit, DeleteMedicineParams> {
  final MedicineRepository repository;
  DeleteMedicine(this.repository);

  // so for delete medicine the param will be the id
  @override
  Future<Either<Failure, Unit>> call(DeleteMedicineParams params) {
    return repository.deleteMedicine(params.id);
  }
}

class DeleteMedicineParams extends Equatable {
  final String id;
  const DeleteMedicineParams({required this.id});

  @override
  List<Object> get props => [id];
}

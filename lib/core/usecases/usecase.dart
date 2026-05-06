import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../error/failures.dart';

/// The base class for all use cases.
/// [Type] is what it returns on success.
/// [params] is what it receives as input.
abstract class UseCase<Type, params> {
  Future<Either<Failure, Type>> call(params params);
}

// use this when a use case needs no input parameters.
// Example: GetMedicines() -> call(NoParams())
class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}

import 'package:equatable/equatable.dart';

/// Base failure class — every error in the app is a subclass of this.
/// Lives on the Left side of Either<Failure, Data>.
abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

// ===
// Concrete failures
// ===

/// Thrown when Isar DB read/write fails.
class DatabaseFailure extends Failure {
  const DatabaseFailure([super.message = 'A database error occurred.']);
}

/// Thrown when scheduling or cancelling a notification fails.
class NotificationFailure extends Failure {
  const NotificationFailure([super.message = 'A notification error occurred.']);
}

/// Catch-all for unexpected errors.
class UnexpectedFailure extends Failure {
  const UnexpectedFailure([super.message = 'An unexpected error occurred.']);
}

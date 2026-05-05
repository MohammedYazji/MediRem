/// Exceptions are thrown inside the data layer (datasources).
/// Repositories catch them and convert them into Failures.
/// ===
/// Rule: Exceptions never leave the data layer.
/// Rule: Failures never come from the data layer directly.

class DatabaseException implements Exception {
  final String message;
  const DatabaseException([this.message = 'Database operation failed.']);
}

class NotificationException implements Exception {
  final String message;
  const NotificationException([
    this.message = 'Notification operation failed.',
  ]);
}

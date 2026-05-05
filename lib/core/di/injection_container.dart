import 'package:get_it/get_it.dart';

/// Global service locator instance.
/// Use [sl]<Type>() anywhere to access a dependency.
final sl = GetIt.instance;

/// Call this once in main() before runApp().
/// Register dependencies in order: External → DataSources → Repositories → UseCases → Blocs
Future<void> init() async {}

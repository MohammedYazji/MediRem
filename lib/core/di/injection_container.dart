import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../features/medicine/data/datasources/medicine_local_datasource.dart';
import '../../features/medicine/data/models/medicine_model.dart';
import '../../features/medicine/data/repositories/medicine_repository_impl.dart';
import '../../features/medicine/domain/repositories/medicine_repository.dart';
import '../../features/medicine/domain/usecases/add_medicine.dart';
import '../../features/medicine/domain/usecases/delete_medicine.dart';
import '../../features/medicine/domain/usecases/get_medicines.dart';

/// Global service locator instance.
/// Use [sl]<Type>() anywhere to access a dependency.
final sl = GetIt.instance;

/// Call this once in main() before runApp().
/// Register dependencies in order: External → DataSources → Repositories → UseCases → Blocs
Future<void> init() async {
  // External (DB, notifications — initialised once)
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open([MedicineModelSchema], directory: dir.path);
  sl.registerSingleton<Isar>(isar);

  // ===
  // Features — Medicine
  // ===

  // UseCases
  sl.registerLazySingleton(() => GetMedicines(sl()));
  sl.registerLazySingleton(() => AddMedicine(sl()));
  sl.registerLazySingleton(() => DeleteMedicine(sl()));

  // Repository
  sl.registerLazySingleton<MedicineRepository>(
    () => MedicineRepositoryImpl(localDataSource: sl()),
  );

  // DataSource
  sl.registerLazySingleton<MedicineLocalDataSource>(
    () => MedicineLocalDataSourceImpl(isar: sl()),
  );
}


import 'package:isar/isar.dart';
import '../../../../core/error/exceptions.dart';
import '../models/medicine_model.dart';

abstract class MedicineLocalDataSource {
  Future<List<MedicineModel>> getMedicines();
  Future<void> addMedicine(MedicineModel model);
  Future<void> deleteMedicine(String id);
  Future<void> toggleMedicine(String id, bool isActive);
}

class MedicineLocalDataSourceImpl implements MedicineLocalDataSource {
  final Isar isar;
  MedicineLocalDataSourceImpl({required this.isar});

  @override
  Future<List<MedicineModel>> getMedicines() async {
    try {
      return await isar.medicineModels.where().findAll();
    } catch (e) {
      throw DatabaseException('Failed to fetch medicines: $e');
    }
  }

  @override
  Future<void> addMedicine(MedicineModel model) async {
    try {
      await isar.writeTxn(() async {
        await isar.medicineModels.put(model);
      });
    } catch (e) {
      throw DatabaseException('Failed to save medicine: $e');
    }
  }

  @override
  Future<void> deleteMedicine(String id) async {
    try {
      await isar.writeTxn(() async {
        await isar.medicineModels.deleteByIndex('id', [id]);
      });
    } catch (e) {
      throw DatabaseException('Failed to delete medicine: $e');
    }
  }

  @override
  Future<void> toggleMedicine(String id, bool isActive) async {
    try {
      await isar.writeTxn(() async {
        final model = await isar.medicineModels.getByIndex('id', [id]);
        if (model == null) throw DatabaseException('Medicine not found.');
        model.isActive = isActive;
        await isar.medicineModels.put(model);
      });
    } catch (e) {
      throw DatabaseException('Failed to toggle medicine: $e');
    }
  }
}

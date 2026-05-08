import 'package:isar/isar.dart';
import '../../domain/entities/medicine.dart';

part 'medicine_model.g.dart';

@Collection()
class MedicineModel {
  Id isarId = Isar.autoIncrement;

  @Index(unique: true)
  late String id;
  late String name;
  late String dosage;
  late String frequency; // stored as string, converted via enum
  late List<DateTime> reminderTimes;
  String? notes;
  late bool isActive;

  Medicine toEntity() => Medicine(
        id: id,
        name: name,
        dosage: dosage,
        frequency: MedicineFrequency.values.byName(frequency),
        reminderTimes: reminderTimes,
        notes: notes,
        isActive: isActive,
      );

  static MedicineModel fromEntity(Medicine m) => MedicineModel()
    ..id = m.id
    ..name = m.name
    ..dosage = m.dosage
    ..frequency = m.frequency.name
    ..reminderTimes = m.reminderTimes
    ..notes = m.notes
    ..isActive = m.isActive;
}
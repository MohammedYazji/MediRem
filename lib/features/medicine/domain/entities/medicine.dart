import 'package:equatable/equatable.dart';

enum MedicineFrequency { daily, weekly, asNeeded }

class Medicine extends Equatable {
  final String id;
  final String name;
  final String dosage;
  final MedicineFrequency frequency;
  final List<DateTime> reminderTimes;
  final String? notes;
  final bool isActive;

  const Medicine({
    required this.id,
    required this.name,
    required this.dosage,
    required this.frequency,
    required this.reminderTimes,
    this.notes,
    this.isActive = true,
  });

  Medicine copyWith({
    String? name,
    String? dosage,
    MedicineFrequency? frequency,
    List<DateTime>? reminderTimes,
    String? notes,
    bool? isActive,
  }) {
    return Medicine(
      id: id,
      name: name ?? this.name,
      dosage: dosage ?? this.dosage,
      frequency: frequency ?? this.frequency,
      reminderTimes: reminderTimes ?? this.reminderTimes,
      notes: notes ?? this.notes,
      isActive: isActive ?? this.isActive,
    );
  }

  // to make Equatable look for those props to compare objects
  @override
  List<Object?> get props =>
      [id, name, dosage, frequency, reminderTimes, notes, isActive];
}

import 'package:flutter/material.dart';

abstract class AppColors {
  // === Brand ===
  static const primary = Color(0xFF1D9E75); // Green — main accent
  static const primaryLight = Color(0xFFE1F5EE); // Green tint — backgrounds
  static const primaryDark = Color(0xFF085041); // Green deep — text on light

  // === Medicine feature ===
  static const medicine = Color(0xFF1D9E75); // Teal green
  static const medicineLight = Color(0xFFE8F6F1);
  static const medicineDark = Color(0xFF0C4D38);

  // === Neutral ===
  static const grey50 = Color(0xFFF1EFE8);
  static const grey100 = Color(0xFFD3D1C7);
  static const grey400 = Color(0xFF888780);
  static const grey600 = Color(0xFF5F5E5A);
  static const grey800 = Color(0xFF444441);
  static const grey900 = Color(0xFF2C2C2A);

  // === Surface ===
  static const surfaceLight = Color(0xFFFAFAF8);
  static const surfaceDark = Color(0xFF1C1C1A);
  static const cardLight = Color(0xFFFFFFFF);
  static const cardDark = Color(0xFF272725);
}

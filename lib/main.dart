import 'package:flutter/material.dart';
import 'core/di/injection_container.dart' as di;
import 'core/theme/app_theme.dart';

void main() async {
  // ensure Initialize the engine layer before doing any logic
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize all dependencies before the app starts
  await di.init();

  runApp(const MediRemApp());
}

class MediRemApp extends StatelessWidget {
  const MediRemApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Config the application with MaterialApp
    return MaterialApp(
      title: 'MediRem',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      // TODO: replace with go_router
      home: const Scaffold(
        body: Center(
          child: Text("MediRem's Core layer ready"),
        ),
      ),
    );
  }
}

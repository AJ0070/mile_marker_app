import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/theme/app_theme.dart';
import 'data/providers/app_providers.dart';
import 'features/dashboard/screens/dashboard_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Isar Local Storage before creating the app scope
  final container = ProviderContainer();
  final localStorage = container.read(localStorageProvider);
  await localStorage.init();

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const MileMarkerApp(),
    ),
  );
}

class MileMarkerApp extends StatelessWidget {
  const MileMarkerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Territory Exploration Map',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const DashboardScreen(),
    );
  }
}

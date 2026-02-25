import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

class TerritoryDefenseAlert extends StatelessWidget {
  final String challengerName;
  final String territoryName;
  final VoidCallback onDefend;

  const TerritoryDefenseAlert({
    super.key,
    required this.challengerName,
    required this.territoryName,
    required this.onDefend,
  });

  static Future<void> show(
    BuildContext context, {
    required String challengerName,
    required String territoryName,
    required VoidCallback onDefend,
  }) {
    return showDialog(
      context: context,
      builder: (context) => TerritoryDefenseAlert(
        challengerName: challengerName,
        territoryName: territoryName,
        onDefend: onDefend,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppTheme.surfaceLight,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.orange.withOpacity(0.5), width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.orange.withOpacity(0.2),
              blurRadius: 20,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.warning_amber_rounded,
                color: Colors.orange,
                size: 48,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Territory Under Attack!',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppTheme.textPrimary,
                  height: 1.5,
                ),
                children: [
                  TextSpan(
                    text: '$challengerName ',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const TextSpan(
                    text: 'is currently running in your territory (',
                  ),
                  TextSpan(
                    text: territoryName,
                    style: const TextStyle(
                      color: AppTheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const TextSpan(text: '). Start a run now to defend it!'),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      'Dismiss',
                      style: TextStyle(color: AppTheme.textSecondary),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      onDefend();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: AppTheme.background,
                    ),
                    child: const Text('Defend'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

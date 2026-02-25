import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

class BadgesAchievementsScreen extends StatelessWidget {
  const BadgesAchievementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Achievements'), elevation: 0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStreakCard(context),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Territory King',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'See All',
                    style: TextStyle(color: AppTheme.primary),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            _buildAchievementCard(
              context,
              title: 'Block Master',
              description: 'Own 5 city blocks simultaneously',
              icon: Icons.grid_on,
              color: AppTheme.primary,
              isCompleted: true,
            ),
            _buildAchievementCard(
              context,
              title: 'District Ruler',
              description: 'Control 25% of a district',
              icon: Icons.map,
              color: AppTheme.secondary,
              isCompleted: false,
              progress: 0.45,
            ),
            const SizedBox(height: 24),
            Text(
              'Distance Milestones',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildBadge(
                  context,
                  '5K Finisher',
                  Icons.directions_run,
                  isUnlocked: true,
                ),
                _buildBadge(
                  context,
                  '10K Club',
                  Icons.directions_run,
                  isUnlocked: true,
                ),
                _buildBadge(
                  context,
                  'Half Marathon',
                  Icons.emoji_events,
                  isUnlocked: false,
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              'Recent Unlocks',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildRecentUnlock(
              context,
              title: 'Early Bird',
              description: 'Completed a run before 6 AM',
              icon: Icons.wb_sunny_outlined,
              date: '2 Days Ago',
            ),
            _buildRecentUnlock(
              context,
              title: 'Speed Demon',
              description: 'Pace under 4:30/km for 1km',
              icon: Icons.speed,
              date: '1 Week Ago',
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildStreakCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.surfaceLight,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.orange.withOpacity(0.5), width: 1),
      ),
      child: Column(
        children: [
          const Icon(
            Icons.local_fire_department,
            color: Colors.orange,
            size: 48,
          ),
          const SizedBox(height: 8),
          Text(
            'Current Streak',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(color: AppTheme.textSecondary),
          ),
          const SizedBox(height: 4),
          Text(
            '5 Days',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppTheme.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          const Text('Keep it burning! 🔥'),
        ],
      ),
    );
  }

  Widget _buildAchievementCard(
    BuildContext context, {
    required String title,
    required String description,
    required IconData icon,
    required Color color,
    required bool isCompleted,
    double progress = 1.0,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surfaceLight,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(isCompleted ? 0.2 : 0.05),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: isCompleted ? color : AppTheme.textSecondary,
              size: 32,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: isCompleted
                        ? AppTheme.textPrimary
                        : AppTheme.textSecondary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppTheme.textSecondary,
                  ),
                ),
                if (!isCompleted) ...[
                  const SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: progress,
                    backgroundColor: AppTheme.surfaceHighlight,
                    color: color,
                    minHeight: 6,
                    borderRadius: BorderRadius.circular(3),
                  ),
                  const SizedBox(height: 4),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      '${(progress * 100).toInt()}%',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: color,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (isCompleted) ...[
            const SizedBox(width: 16),
            const Icon(Icons.check_circle, color: AppTheme.primary),
          ],
        ],
      ),
    );
  }

  Widget _buildBadge(
    BuildContext context,
    String label,
    IconData icon, {
    required bool isUnlocked,
  }) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: isUnlocked
                ? LinearGradient(
                    colors: [AppTheme.primary, AppTheme.secondary],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                : const LinearGradient(
                    colors: [AppTheme.surfaceLight, AppTheme.surfaceLight],
                  ),
            border: Border.all(
              color: isUnlocked
                  ? Colors.transparent
                  : AppTheme.surfaceHighlight,
              width: 2,
            ),
          ),
          child: Icon(
            icon,
            size: 40,
            color: isUnlocked ? AppTheme.background : AppTheme.textSecondary,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: isUnlocked ? AppTheme.textPrimary : AppTheme.textSecondary,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildRecentUnlock(
    BuildContext context, {
    required String title,
    required String description,
    required IconData icon,
    required String date,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: AppTheme.surfaceLight,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: AppTheme.primary),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(description),
      trailing: Text(
        date,
        style: const TextStyle(color: AppTheme.textSecondary, fontSize: 12),
      ),
    );
  }
}

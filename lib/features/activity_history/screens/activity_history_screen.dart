import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

class ActivityHistoryScreen extends StatelessWidget {
  const ActivityHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Activity History'), elevation: 0),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: _buildSummaryStats(context)),
          const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            sliver: SliverToBoxAdapter(
              child: Text(
                'October 2023',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textPrimary,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              _buildActivityItem(
                context,
                title: 'Morning Jog',
                distance: '5.2 km',
                time: '32:15',
                date: 'Oct 24, 07:30 AM',
                icon: Icons.directions_run,
                color: AppTheme.primary,
              ),
              _buildActivityItem(
                context,
                title: 'Sunset Run',
                distance: '3.8 km',
                time: '24:10',
                date: 'Oct 22, 06:15 PM',
                icon: Icons.directions_walk,
                color: AppTheme.secondary,
              ),
              _buildActivityItem(
                context,
                title: 'Lunch Break Loop',
                distance: '2.5 km',
                time: '15:20',
                date: 'Oct 18, 12:45 PM',
                icon: Icons.directions_run,
                color: AppTheme.primary,
              ),
            ]),
          ),
          const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            sliver: SliverToBoxAdapter(
              child: Text(
                'September 2023',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textPrimary,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              _buildActivityItem(
                context,
                title: 'City Explorer',
                distance: '8.4 km',
                time: '52:10',
                date: 'Sep 30, 09:00 AM',
                icon: Icons.explore,
                color: AppTheme.tertiary,
              ),
            ]),
          ),
          const SliverPadding(padding: EdgeInsets.only(bottom: 24.0)),
        ],
      ),
    );
  }

  Widget _buildSummaryStats(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: AppTheme.surfaceLight,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text(
                'Total Distance',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: AppTheme.textSecondary),
              ),
              const SizedBox(height: 8),
              Text(
                '124.5',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: AppTheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'km',
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: AppTheme.primary),
              ),
            ],
          ),
          Container(height: 50, width: 1, color: AppTheme.surfaceHighlight),
          Column(
            children: [
              Text(
                'Territory',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: AppTheme.textSecondary),
              ),
              const SizedBox(height: 8),
              Text(
                '42',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: AppTheme.secondary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'zones',
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: AppTheme.secondary),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActivityItem(
    BuildContext context, {
    required String title,
    required String distance,
    required String time,
    required String date,
    required IconData icon,
    required Color color,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 0,
      color: AppTheme.surface,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: color, size: 28),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    date,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppTheme.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  distance,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppTheme.textSecondary,
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

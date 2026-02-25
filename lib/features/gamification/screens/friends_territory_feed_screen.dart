import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

class FriendsTerritoryFeedScreen extends StatelessWidget {
  const FriendsTerritoryFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Friends Feed'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.person_add_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildFeedItem(
            context,
            name: 'Sarah Miles',
            action: 'claimed 3 zones in Central Park.',
            timeAgo: '10 mins ago',
            color: AppTheme.secondary,
            initials: 'SM',
            isDefenseAlert: false,
          ),
          _buildFeedItem(
            context,
            name: 'Mike Jogger',
            action: 'started a run in your territory (Downtown).',
            timeAgo: '1 hour ago',
            color: Colors.orange,
            initials: 'MJ',
            isDefenseAlert: true,
          ),
          _buildFeedItem(
            context,
            name: 'Emma Pace',
            action: 'unlocked the "Speed Demon" badge.',
            timeAgo: '3 hours ago',
            color: AppTheme.primary,
            initials: 'EP',
            isDefenseAlert: false,
            icon: Icons.emoji_events,
          ),
          _buildFeedItem(
            context,
            name: 'David Sprint',
            action: 'completed a 10km run.',
            timeAgo: 'Yesterday',
            color: AppTheme.primary,
            initials: 'DS',
            isDefenseAlert: false,
          ),
        ],
      ),
    );
  }

  Widget _buildFeedItem(
    BuildContext context, {
    required String name,
    required String action,
    required String timeAgo,
    required Color color,
    required String initials,
    required bool isDefenseAlert,
    IconData? icon,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      color: AppTheme.surfaceLight,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: color.withOpacity(0.2),
              child: Text(
                initials,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppTheme.textPrimary,
                        height: 1.4,
                      ),
                      children: [
                        TextSpan(
                          text: '$name ',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: action,
                          style: TextStyle(
                            color: isDefenseAlert
                                ? Colors.orange
                                : AppTheme.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        timeAgo,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppTheme.textSecondary,
                        ),
                      ),
                      if (icon != null) ...[
                        const SizedBox(width: 8),
                        Icon(icon, size: 14, color: color),
                      ],
                    ],
                  ),
                ],
              ),
            ),
            if (isDefenseAlert) ...[
              const SizedBox(width: 12),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.shield_outlined, color: Colors.orange),
                tooltip: 'Defend Territory',
              ),
            ],
          ],
        ),
      ),
    );
  }
}

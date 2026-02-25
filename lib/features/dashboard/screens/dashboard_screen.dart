import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import '../../activity_history/screens/activity_history_screen.dart';
import '../../run_tracking/screens/live_run_screen.dart';
import '../../territory_map/screens/territory_map_screen.dart';
import '../../gamification/screens/profile_ranking_screen.dart';
import '../../gamification/screens/badges_achievements_screen.dart';
import '../../gamification/screens/territory_challenges_screen.dart';
import '../../gamification/screens/friends_territory_feed_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const _DashboardContent(),
    const TerritoryMapScreen(),
    const Center(child: Text("Start a run from the Dashboard!")),
    const BadgesAchievementsScreen(),
    const ProfileRankingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text('My Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            label: 'Territory',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_run),
            label: 'Run',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.military_tech_outlined),
            label: 'Badges',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LiveRunScreen()),
          );
        },
        backgroundColor: AppTheme.primary,
        foregroundColor: AppTheme.background,
        icon: const Icon(Icons.play_arrow),
        label: const Text('Start Run'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class _DashboardContent extends StatelessWidget {
  const _DashboardContent();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildGreetingHeader(context),
          const SizedBox(height: 24),
          _buildWeeklyStatsCard(context),
          const SizedBox(height: 24),
          Text('Quick Actions', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 16),
          _buildQuickActions(context),
        ],
      ),
    );
  }

  Widget _buildGreetingHeader(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 28,
          backgroundColor: AppTheme.surfaceLight,
          child: Icon(Icons.person, size: 32, color: AppTheme.textSecondary),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Good Morning,', style: Theme.of(context).textTheme.bodyLarge),
            Text(
              'Alex Runner',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppTheme.textPrimary,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildWeeklyStatsCard(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'This Week',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const Icon(Icons.bar_chart, color: AppTheme.primary),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem(context, 'Distance', '24.5', 'km'),
                _buildStatItem(context, 'Runs', '4', ''),
                _buildStatItem(context, 'Territory', '12', 'tiles'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(
    BuildContext context,
    String label,
    String value,
    String unit,
  ) {
    return Column(
      children: [
        Text(
          value,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: AppTheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          unit,
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: AppTheme.primary),
        ),
        const SizedBox(height: 4),
        Text(label, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildActionCard(context, Icons.history, 'History', () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ActivityHistoryScreen(),
            ),
          );
        }),
        _buildActionCard(
          context,
          Icons.emoji_events_outlined,
          'Challenges',
          () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TerritoryChallengesScreen(),
              ),
            );
          },
        ),
        _buildActionCard(context, Icons.group_outlined, 'Friends', () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FriendsTerritoryFeedScreen(),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildActionCard(
    BuildContext context,
    IconData icon,
    String label,
    VoidCallback onTap,
  ) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          color: AppTheme.surfaceLight,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              children: [
                Icon(icon, color: AppTheme.primary, size: 32),
                const SizedBox(height: 8),
                Text(label, style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'widgets/desktop_sidebar.dart';
import 'chat_video_view.dart';

class DashboardView extends StatefulWidget {
  final ValueChanged<SidebarItem>? onSidebarNavigation;

  const DashboardView({
    super.key,
    this.onSidebarNavigation,
  });

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  final TextEditingController _searchController = TextEditingController();

  void _onActionTapped(String actionName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('تم فتح: $actionName'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: Row(
        children: [
          // Main Content Area
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Top Gradient Header Bar
                  _buildTopHeader(),
                  const SizedBox(height: 16),

                  // Main White Content Card
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: const Color(0xFFE2E8F0),
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.04),
                          blurRadius: 18,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28,
                      vertical: 24,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Search bar
                        _buildSearchBar(),
                        const SizedBox(height: 24),

                        // Section Header: دورات الترم 05
                        _buildSectionHeader(),
                        const SizedBox(height: 16),

                        // Course Cards Row
                        _buildCourseCardsRow(),
                        const SizedBox(height: 28),

                        // 2x2 Quick Actions Grid (All Active Buttons)
                        _buildQuickActionsGrid(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Right Sidebar Navigation
          DesktopSidebar(
            selectedItem: SidebarItem.home,
            onItemSelected: (item) {
              widget.onSidebarNavigation?.call(item);
              if (item == SidebarItem.message) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const ChatVideoView()),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTopHeader() {
    return Container(
      height: 76,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF26B7AB), // Teal
            Color(0xFF1E1B4B), // Deep Navy
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1E1B4B).withValues(alpha: 0.12),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left: User Avatar (Clean Placeholder Box)
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withValues(alpha: 0.25),
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: const Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ],
          ),

          // Right: Greeting & Name
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Text(
                'Good Morning',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.3,
                ),
              ),
              SizedBox(height: 2),
              Text(
                'رييش عجلان',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFFE2E8F0), width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'Search here...',
          hintStyle: TextStyle(
            fontSize: 13,
            color: Colors.grey.shade400,
          ),
          prefixIcon: Icon(
            Icons.search_rounded,
            size: 20,
            color: Colors.grey.shade500,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 12),
        ),
      ),
    );
  }

  Widget _buildSectionHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Left: Carousel Indicators
        Row(
          children: [
            Container(
              width: 22,
              height: 4,
              decoration: BoxDecoration(
                color: const Color(0xFF1E1B4B),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 4),
            Container(
              width: 5,
              height: 4,
              decoration: BoxDecoration(
                color: const Color(0xFFCBD5E1),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 4),
            Container(
              width: 5,
              height: 4,
              decoration: BoxDecoration(
                color: const Color(0xFFCBD5E1),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ],
        ),

        // Right: Title in Arabic
        const Text(
          'دورات الترم 05',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w800,
            color: Color(0xFF1E1B4B),
          ),
        ),
      ],
    );
  }

  Widget _buildCourseCardsRow() {
    return Row(
      children: [
        Expanded(
          child: _buildCourseCard(
            title: 'Level 2B',
            teacher: 'T. Rebeesh Ajlan',
            time: '02:00PM-04:00PM',
            badgeColor: const Color(0xFF15803D),
            badgeTitle: 'English File',
          ),
        ),
        const SizedBox(width: 18),
        Expanded(
          child: _buildCourseCard(
            title: 'Level 3A',
            teacher: 'T. Rebeesh Ajlan',
            time: '04:00PM-06:00PM',
            badgeColor: const Color(0xFFB91C1C),
            badgeTitle: 'Ventures 1',
          ),
        ),
      ],
    );
  }

  Widget _buildCourseCard({
    required String title,
    required String teacher,
    required String time,
    required Color badgeColor,
    required String badgeTitle,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => _onActionTapped(title),
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFE2E8F0), width: 1.1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.03),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              // Course Thumbnail Placeholder Box
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: 58,
                  height: 58,
                  color: badgeColor,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.menu_book_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        badgeTitle,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 8.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),

              // Course Information
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1E1B4B),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      teacher,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF26B7AB),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(
                          Icons.access_time_rounded,
                          size: 13,
                          color: Color(0xFF94A3B8),
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            time,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF64748B),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickActionsGrid() {
    return Column(
      children: [
        // Top Row: كتابة التقارير (Navy Button) + رفع الدرجات (Teal Button)
        Row(
          children: [
            Expanded(
              child: _buildActionCard(
                title: 'كتابة التقارير',
                icon: Icons.edit_note_rounded,
                backgroundColor: const Color(0xFF1E1B4B),
                onTap: () => _onActionTapped('كتابة التقارير'),
              ),
            ),
            const SizedBox(width: 18),
            Expanded(
              child: _buildActionCard(
                title: 'رفع الدرجات',
                icon: Icons.assessment_outlined,
                backgroundColor: const Color(0xFF26B7AB),
                onTap: () => _onActionTapped('رفع الدرجات'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 18),

        // Bottom Row: الواجبات (Teal Button) + تحضير الطلاب (Navy Button)
        Row(
          children: [
            Expanded(
              child: _buildActionCard(
                title: 'الواجبات',
                icon: Icons.menu_book_rounded,
                backgroundColor: const Color(0xFF26B7AB),
                onTap: () => _onActionTapped('الواجبات'),
              ),
            ),
            const SizedBox(width: 18),
            Expanded(
              child: _buildActionCard(
                title: 'تحضير الطلاب',
                icon: Icons.assignment_turned_in_outlined,
                backgroundColor: const Color(0xFF1E1B4B),
                onTap: () => _onActionTapped('تحضير الطلاب'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionCard({
    required String title,
    required IconData icon,
    required Color backgroundColor,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        hoverColor: Colors.white.withValues(alpha: 0.1),
        child: Container(
          height: 105,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: backgroundColor.withValues(alpha: 0.28),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 32,
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'widgets/desktop_sidebar.dart';

class TeacherProfileView extends StatefulWidget {
  final ValueChanged<SidebarItem>? onSidebarNavigation;

  const TeacherProfileView({
    super.key,
    this.onSidebarNavigation,
  });

  @override
  State<TeacherProfileView> createState() => _TeacherProfileViewState();
}

class _TeacherProfileViewState extends State<TeacherProfileView> {
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

                  // Main White Content Container
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
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Card Top Header: Last updated & Profile title
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Last updated: November 2, 2026',
                              style: TextStyle(
                                fontSize: 11,
                                color: Color(0xFF94A3B8),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'Profile',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF1E1B4B),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        // Teacher Info Header Box
                        _buildTeacherInfoHeader(),
                        const SizedBox(height: 20),

                        // 4 Stats / Metrics Row
                        _buildStatsRow(),
                        const SizedBox(height: 24),

                        // Middle Section: My Current Courses (Left) + Personal Details (Right)
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Left: Current Courses
                            Expanded(
                              flex: 6,
                              child: _buildCurrentCoursesSection(),
                            ),
                            const SizedBox(width: 20),
                            // Right: Personal Details
                            Expanded(
                              flex: 4,
                              child: _buildPersonalDetailsCard(),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),

                        // Bottom Section: My Certificates & Achievements
                        _buildCertificatesSection(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Right Sidebar Navigation (Profile Active + Support Card)
          DesktopSidebar(
            selectedItem: SidebarItem.profile,
            onItemSelected: widget.onSidebarNavigation,
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
          // Left: User Avatar (image/4.jpeg) + Notification Bell
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: ClipOval(
                  child: Image.asset(
                    'image/4.jpeg',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        'assets/images/4.jpeg',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 28,
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withValues(alpha: 0.2),
                ),
                child: const Icon(
                  Icons.notifications_none_rounded,
                  color: Colors.white,
                  size: 18,
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

  Widget _buildTeacherInfoHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left: Edit Profile Button & Member Date
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.edit_outlined, size: 14),
                label: const Text(
                  'Edit Profile',
                  style: TextStyle(fontSize: 11.5, fontWeight: FontWeight.w700),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF26B7AB),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Member since January 2021',
                style: TextStyle(
                  fontSize: 10,
                  color: Color(0xFF94A3B8),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

          // Right: Teacher info and Avatar
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: const Color(0xFFCCFBF1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          'Verified Account ✓',
                          style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF0F766E),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Rabish Ajlan',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF1E1B4B),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    'English Teacher • 9 years of experience',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF64748B),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _tagBadge('Interactive Learning'),
                      const SizedBox(width: 6),
                      _tagBadge('Secondary School'),
                      const SizedBox(width: 6),
                      _tagBadge('English Language'),
                    ],
                  ),
                ],
              ),
              const SizedBox(width: 14),
              // Big Profile Picture
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFF26B7AB), width: 2),
                ),
                child: ClipOval(
                  child: Image.asset(
                    'image/4.jpeg',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        'assets/images/4.jpeg',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.person,
                            color: Color(0xFF1E1B4B),
                            size: 32,
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _tagBadge(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: const Color(0xFFF0FDFA),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: const Color(0xFF99F6E4), width: 0.8),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 9.5,
          fontWeight: FontWeight.w600,
          color: Color(0xFF0F766E),
        ),
      ),
    );
  }

  Widget _buildStatsRow() {
    return Row(
      children: [
        Expanded(
          child: _statCard(
            title: 'Learning Hours',
            value: '96',
            subtitle: 'Investing in your future',
            icon: Icons.access_time_rounded,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _statCard(
            title: 'Certified Badges',
            value: '8',
            subtitle: 'Achievements to be proud of',
            icon: Icons.military_tech_outlined,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _statCard(
            title: 'Current Courses',
            value: '3',
            subtitle: 'Your next step to excellence',
            icon: Icons.menu_book_outlined,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _statCard(
            title: 'Completed Courses',
            value: '12',
            subtitle: 'A continued journey of success',
            icon: Icons.school_outlined,
          ),
        ),
      ],
    );
  }

  Widget _statCard({
    required String title,
    required String value,
    required String subtitle,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 10.5,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF64748B),
                ),
              ),
              Icon(icon, size: 16, color: const Color(0xFF26B7AB)),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w900,
              color: Color(0xFF1E1B4B),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 8.5,
              color: Color(0xFF94A3B8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentCoursesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {},
              child: const Text(
                'View all courses →',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF26B7AB),
                ),
              ),
            ),
            const Text(
              'My Current Courses',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w800,
                color: Color(0xFF1E1B4B),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        _courseProgressItem(
          title: 'Modern Teaching Strategies',
          progress: 0.75,
          progressText: '75%',
          subtitle: '5 of 8 lessons • 2 hours remaining',
          icon: Icons.computer_outlined,
        ),
        const SizedBox(height: 10),
        _courseProgressItem(
          title: 'Assessment for Learning',
          progress: 0.40,
          progressText: '40%',
          subtitle: '4 of 10 lessons • 4 hours remaining',
          icon: Icons.assignment_outlined,
        ),
        const SizedBox(height: 10),
        _courseProgressItem(
          title: 'Technology Integration in the Classroom',
          progress: 0.25,
          progressText: '25%',
          subtitle: '2 of 8 lessons • 6 hours remaining',
          icon: Icons.laptop_chromebook_outlined,
        ),
      ],
    );
  }

  Widget _courseProgressItem({
    required String title,
    required double progress,
    required String progressText,
    required String subtitle,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Row(
        children: [
          // Icon on left
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: const Color(0xFFE6FFFA),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: const Color(0xFF26B7AB), size: 20),
          ),
          const SizedBox(width: 12),
          // Title & Progress Bar
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1E1B4B),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      progressText,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF26B7AB),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 5,
                    backgroundColor: const Color(0xFFE2E8F0),
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Color(0xFF26B7AB)),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 9.5,
                    color: Color(0xFF94A3B8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPersonalDetailsCard() {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.person_outline, size: 16, color: Color(0xFF26B7AB)),
              SizedBox(width: 6),
              Text(
                'Personal Details',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF1E1B4B),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          _detailRow(Icons.badge_outlined, 'Teacher ID', 'AFW-2200440'),
          _detailRow(Icons.mail_outline, 'Email', 'r.ajlan@afwi.edu'),
          _detailRow(Icons.phone_outlined, 'Mobile', '+967 771 234 567'),
          _detailRow(Icons.school_outlined, 'Qualification',
              'Bachelor of English Language'),
          _detailRow(
              Icons.business_outlined, 'Workplace', 'Al-Nahda Private School'),
          _detailRow(Icons.location_on_outlined, 'City', 'Sana\'a, Yemen'),
          const SizedBox(height: 8),
          // Goal Box
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFF0FDFA),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFCCFBF1)),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.pie_chart_outline_rounded,
                  size: 24,
                  color: Color(0xFF26B7AB),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Your Professional Goal This Year',
                        style: TextStyle(
                          fontSize: 9.5,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF0F766E),
                        ),
                      ),
                      Text(
                        '96 of 120 learning hours (80% completed)',
                        style: TextStyle(
                          fontSize: 8.5,
                          color: Color(0xFF64748B),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _detailRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 14, color: const Color(0xFF94A3B8)),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 10.5,
                fontWeight: FontWeight.w600,
                color: Color(0xFF334155),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCertificatesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {},
              child: const Text(
                'View all certificates →',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF26B7AB),
                ),
              ),
            ),
            const Text(
              'My Certificates & Achievements',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w800,
                color: Color(0xFF1E1B4B),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _certificateCard(
                title: 'Consistent Learner',
                subtitle: '50 days of continuous learning',
                icon: Icons.thumb_up_alt_outlined,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: _certificateCard(
                title: 'Digital Teacher',
                subtitle: 'Certificate - October 2025',
                icon: Icons.verified_outlined,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: _certificateCard(
                title: 'Teaching Excellence',
                subtitle: 'Certificate - September 2025',
                icon: Icons.emoji_events_outlined,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _certificateCard({
    required String title,
    required String subtitle,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Row(
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: const Color(0xFFFFFBEB),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: const Color(0xFFF59E0B), size: 18),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 11.5,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1E1B4B),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 9,
                    color: Color(0xFF94A3B8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

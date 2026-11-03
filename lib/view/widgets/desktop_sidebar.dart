import 'package:flutter/material.dart';
import 'afwi_logo.dart';
import '../dashboard_view.dart';
import '../pt_grades_view.dart';
import '../chat_video_view.dart';
import '../teacher_profile_view.dart';

enum SidebarItem {
  home,
  pt,
  message,
  profile,
}

class DesktopSidebar extends StatelessWidget {
  final SidebarItem selectedItem;
  final ValueChanged<SidebarItem>? onItemSelected;

  const DesktopSidebar({
    super.key,
    required this.selectedItem,
    this.onItemSelected,
  });

  void _navigate(BuildContext context, SidebarItem item) {
    if (item == selectedItem) return;

    if (onItemSelected != null) {
      onItemSelected!(item);
      return;
    }

    Widget destination;
    switch (item) {
      case SidebarItem.home:
        destination = const DashboardView();
        break;
      case SidebarItem.pt:
        destination = const PtGradesView();
        break;
      case SidebarItem.message:
        destination = const ChatVideoView();
        break;
      case SidebarItem.profile:
        destination = const TeacherProfileView();
        break;
    }

    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => destination,
        transitionDuration: Duration.zero,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 195,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          left: BorderSide(color: Color(0xFFE2E8F0), width: 1),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 8),
          // Official AFWI Logo
          const AfwiLogo(width: 145),
          const SizedBox(height: 44),

          // 1. HOME Button
          _buildItem(
            context: context,
            item: SidebarItem.home,
            title: 'HOME',
            icon: Icons.home_outlined,
          ),
          const SizedBox(height: 14),

          // 2. P.T Button
          _buildItem(
            context: context,
            item: SidebarItem.pt,
            title: 'P.T',
            icon: Icons.assignment_outlined,
          ),
          const SizedBox(height: 14),

          // 3. Message Button
          _buildItem(
            context: context,
            item: SidebarItem.message,
            title: 'Message',
            icon: Icons.chat_bubble_outline_rounded,
          ),
          const SizedBox(height: 14),

          // 4. Profile Button
          _buildItem(
            context: context,
            item: SidebarItem.profile,
            title: 'Profile',
            icon: Icons.person_outline_rounded,
          ),

          const Spacer(),
        ],
      ),
    );
  }

  Widget _buildItem({
    required BuildContext context,
    required SidebarItem item,
    required String title,
    required IconData icon,
  }) {
    final bool isSelected = selectedItem == item;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => _navigate(context, item),
        borderRadius: BorderRadius.circular(22),
        hoverColor: const Color(0xFFF1F5F9),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          height: 44,
          padding: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFA2E5DE) : Colors.white,
            borderRadius: BorderRadius.circular(22),
            border: isSelected
                ? Border.all(color: const Color(0xFF6ED3C8), width: 1.2)
                : Border.all(color: const Color(0xFFE2E8F0), width: 1.2),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: isSelected ? 0.04 : 0.02),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: 'sans-serif',
                    fontSize: 13,
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
                    color: isSelected
                        ? const Color(0xFF135A52)
                        : const Color(0xFF334155),
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              const SizedBox(width: 6),
              Icon(
                icon,
                size: 20,
                color: isSelected
                    ? const Color(0xFF135A52)
                    : const Color(0xFF475569),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

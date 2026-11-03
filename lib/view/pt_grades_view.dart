import 'package:flutter/material.dart';
import 'widgets/desktop_sidebar.dart';

class PtGradesView extends StatefulWidget {
  final ValueChanged<SidebarItem>? onSidebarNavigation;

  const PtGradesView({
    super.key,
    this.onSidebarNavigation,
  });

  @override
  State<PtGradesView> createState() => _PtGradesViewState();
}

class _PtGradesViewState extends State<PtGradesView> {
  int _currentPage = 1;

  final List<Map<String, dynamic>> _students = [
    {
      'name': 'Adel',
      'id': '2200440',
      'presence': '',
      'hw': '',
      'midterm': '',
      'final': '',
      'total': '',
      'status': '',
    },
    {
      'name': 'Adel',
      'id': '2200440',
      'presence': '',
      'hw': '',
      'midterm': '',
      'final': '',
      'total': '',
      'status': '',
    },
    {
      'name': 'Adel',
      'id': '2200440',
      'presence': '',
      'hw': '',
      'midterm': '',
      'final': '',
      'total': '',
      'status': '',
    },
    {
      'name': 'Adel',
      'id': '2200440',
      'presence': '',
      'hw': '',
      'midterm': '',
      'final': '',
      'total': '',
      'status': '',
    },
    {
      'name': 'Adel',
      'id': '2200440',
      'presence': '',
      'hw': '',
      'midterm': '',
      'final': '',
      'total': '',
      'status': '',
    },
    {
      'name': 'Adel',
      'id': '2200440',
      'presence': '',
      'hw': '',
      'midterm': '',
      'final': '',
      'total': '',
      'status': '',
    },
    {
      'name': 'Adel',
      'id': '2200440',
      'presence': '',
      'hw': '',
      'midterm': '',
      'final': '',
      'total': '',
      'status': '',
    },
  ];

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
                      horizontal: 24,
                      vertical: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Top action buttons: Submit Grades & Add Student
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            _buildActionButton(
                              title: 'Submit Grades',
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Submit Grades clicked'),
                                    duration: Duration(seconds: 1),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(width: 10),
                            _buildActionButton(
                              title: 'Add Student',
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Add Student clicked'),
                                    duration: Duration(seconds: 1),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        // Table Header
                        _buildTableHeader(),
                        const SizedBox(height: 10),

                        // Table Rows
                        ..._students.map((student) => _buildTableRow(student)),
                        const SizedBox(height: 20),

                        // Table Footer (Pagination & Action buttons)
                        _buildTableFooter(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Right Sidebar Navigation (P.T Active)
          DesktopSidebar(
            selectedItem: SidebarItem.pt,
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

  Widget _buildActionButton({
    required String title,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF26B7AB),
        foregroundColor: Colors.white,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.2,
        ),
      ),
    );
  }

  Widget _buildTableHeader() {
    return Container(
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1B4B),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(flex: 2, child: _headerText('student Name')),
          Expanded(flex: 2, child: _headerText('student ID')),
          Expanded(flex: 2, child: _headerText('presence')),
          Expanded(flex: 2, child: _headerText('H.W')),
          Expanded(flex: 2, child: _headerText('Midterm Exam')),
          Expanded(flex: 2, child: _headerText('Final Exam')),
          Expanded(flex: 2, child: _headerText('Total')),
          Expanded(flex: 2, child: _headerText('Status')),
        ],
      ),
    );
  }

  static Widget _headerText(String text) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 11,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildTableRow(Map<String, dynamic> student) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      child: Row(
        children: [
          // student Name
          Expanded(
            flex: 2,
            child: Text(
              student['name'] as String,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1E293B),
              ),
            ),
          ),
          // student ID
          Expanded(
            flex: 2,
            child: Text(
              student['id'] as String,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xFF475569),
              ),
            ),
          ),
          // presence pill
          Expanded(flex: 2, child: _buildInputPill()),
          // H.W pill
          Expanded(flex: 2, child: _buildInputPill()),
          // Midterm Exam pill
          Expanded(flex: 2, child: _buildInputPill()),
          // Final Exam pill
          Expanded(flex: 2, child: _buildInputPill()),
          // Total pill
          Expanded(flex: 2, child: _buildInputPill()),
          // Status pill
          Expanded(flex: 2, child: _buildInputPill()),
        ],
      ),
    );
  }

  Widget _buildInputPill() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        height: 28,
        decoration: BoxDecoration(
          color: const Color(0xFFF8FAFC),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xFFE2E8F0), width: 1.2),
        ),
      ),
    );
  }

  Widget _buildTableFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Left: Pagination
        Row(
          children: [
            const Text(
              'Showing 1-7 of 30 Student',
              style: TextStyle(
                fontSize: 11.5,
                color: Color(0xFF64748B),
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 10),
            Container(
              height: 16,
              width: 1,
              color: const Color(0xFFCBD5E1),
            ),
            const SizedBox(width: 10),
            _pageButton('Prev', isText: true, onTap: () {
              if (_currentPage > 1) setState(() => _currentPage--);
            }),
            const SizedBox(width: 6),
            _pageButton('1', isSelected: _currentPage == 1, onTap: () {
              setState(() => _currentPage = 1);
            }),
            const SizedBox(width: 4),
            _pageButton('2', isSelected: _currentPage == 2, onTap: () {
              setState(() => _currentPage = 2);
            }),
            const SizedBox(width: 4),
            _pageButton('3', isSelected: _currentPage == 3, onTap: () {
              setState(() => _currentPage = 3);
            }),
            const SizedBox(width: 6),
            _pageButton('Next', isText: true, onTap: () {
              if (_currentPage < 3) setState(() => _currentPage++);
            }),
          ],
        ),

        // Right: Reset & Save changes buttons
        Row(
          children: [
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFF475569),
                side: const BorderSide(color: Color(0xFFCBD5E1)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Reset',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Changes saved successfully!'),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF26B7AB),
                foregroundColor: Colors.white,
                elevation: 0,
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Save changes',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _pageButton(
    String label, {
    bool isSelected = false,
    bool isText = false,
    required VoidCallback onTap,
  }) {
    if (isText) {
      return InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 11.5,
              fontWeight: FontWeight.w500,
              color: Color(0xFF64748B),
            ),
          ),
        ),
      );
    }

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 24,
        height: 24,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF26B7AB) : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 11.5,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
            color: isSelected ? Colors.white : const Color(0xFF64748B),
          ),
        ),
      ),
    );
  }
}

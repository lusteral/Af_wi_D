import 'package:flutter/material.dart';
import 'widgets/desktop_sidebar.dart';
import 'dashboard_view.dart';

class ChatVideoView extends StatefulWidget {
  final ValueChanged<SidebarItem>? onSidebarNavigation;

  const ChatVideoView({
    super.key,
    this.onSidebarNavigation,
  });

  @override
  State<ChatVideoView> createState() => _ChatVideoViewState();
}

class _ChatVideoViewState extends State<ChatVideoView> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _isCallActive = true;

  final List<Map<String, dynamic>> _messages = [
    {
      'text': 'Yes, I have.',
      'isMe': true,
      'time': '9:30 AM',
    },
    {
      'text': 'Okay, please meet me at Franklin Avenue at 5 pm',
      'isMe': false,
      'time': '9:44 AM',
    },
    {
      'text': 'Roger that sir, thankyou',
      'isMe': true,
      'time': '9:50 AM',
    },
  ];

  void _sendMessage() {
    final text = _messageController.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _messages.add({
        'text': text,
        'isMe': true,
        'time': 'Just now',
      });
      _messageController.clear();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _toggleCall() {
    setState(() {
      _isCallActive = !_isCallActive;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _isCallActive ? 'تم استئناف المكالمة' : 'تم إنهاء المكالمة',
        ),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: Row(
        children: [
          // Main Video & Chat Area
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Container(
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
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Top: Video Conference Box (Solid Black Background)
                    _buildVideoConferenceBox(),
                    const SizedBox(height: 14),

                    // Header: Level 3A & Participants count
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Level 3A',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF1E1B4B),
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              '32 Participants Online',
                              style: TextStyle(
                                fontSize: 11.5,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF26B7AB),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    // Chat messages list
                    Expanded(
                      child: ListView.builder(
                        controller: _scrollController,
                        itemCount: _messages.length,
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        itemBuilder: (context, index) {
                          final msg = _messages[index];
                          return _buildChatBubble(
                            text: msg['text'] as String,
                            isMe: msg['isMe'] as bool,
                            time: msg['time'] as String,
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Bottom message input bar
                    _buildMessageInput(),
                  ],
                ),
              ),
            ),
          ),

          // Right Sidebar Navigation
          DesktopSidebar(
            selectedItem: SidebarItem.message,
            onItemSelected: (item) {
              widget.onSidebarNavigation?.call(item);
              if (item == SidebarItem.home) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const DashboardView()),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildVideoConferenceBox() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        // Video Stream Container with Solid Black Background (No images)
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: 220,
            width: double.infinity,
            color: Colors.black, // لون أسود كامل بدلاً من الصورة
          ),
        ),

        // Bottom Left Duration badge: ● 22:15
        if (_isCallActive)
          Positioned(
            left: 16,
            bottom: 14,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(
                    Icons.fiber_manual_record,
                    size: 9,
                    color: Color(0xFFEF4444),
                  ),
                  SizedBox(width: 4),
                  Text(
                    '22:15',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),

        // Bottom Center Hang Up Button (Active Button)
        Positioned(
          bottom: 10,
          child: Tooltip(
            message: _isCallActive ? 'إنهاء المكالمة' : 'بدء المكالمة',
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: _toggleCall,
                borderRadius: BorderRadius.circular(24),
                child: Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: _isCallActive
                        ? const Color(0xFFEB3B5A)
                        : const Color(0xFF10B981),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: (_isCallActive
                                ? const Color(0xFFEB3B5A)
                                : const Color(0xFF10B981))
                            .withValues(alpha: 0.45),
                        blurRadius: 14,
                        spreadRadius: 2,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Icon(
                    _isCallActive
                        ? Icons.call_end_rounded
                        : Icons.call_rounded,
                    color: Colors.white,
                    size: 22,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildChatBubble({
    required String text,
    required bool isMe,
    required String time,
  }) {
    final bubbleColor =
        isMe ? const Color(0xFF1E1B4B) : const Color(0xFF26B7AB);

    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Column(
          crossAxisAlignment:
              isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Container(
              constraints: const BoxConstraints(maxWidth: 380),
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
              decoration: BoxDecoration(
                color: bubbleColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  height: 1.35,
                ),
              ),
            ),
            const SizedBox(height: 3),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Text(
                time,
                style: const TextStyle(
                  fontSize: 10,
                  color: Color(0xFF94A3B8),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      height: 48,
      padding: const EdgeInsets.only(left: 18, right: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFE2E8F0), width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              onSubmitted: (_) => _sendMessage(),
              decoration: InputDecoration(
                hintText: 'Type message...',
                hintStyle: TextStyle(
                  fontSize: 13,
                  color: Colors.grey.shade400,
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
          ),
          // Active Send Button
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: _sendMessage,
              borderRadius: BorderRadius.circular(18),
              child: Container(
                width: 52,
                height: 36,
                decoration: BoxDecoration(
                  color: const Color(0xFF26B7AB),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Icon(
                  Icons.near_me_rounded,
                  color: Color(0xFF1E1B4B),
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

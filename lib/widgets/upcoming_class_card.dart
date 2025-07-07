import 'package:flutter/material.dart';
import '../models/course.dart';

class UpcomingClassCard extends StatelessWidget {
  final Course course;

  const UpcomingClassCard({super.key, required this.course});

  String _formatTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = dateTime.difference(now);
    
    if (difference.inDays > 0) {
      return '${difference.inDays}d';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h';
    } else {
      return '${difference.inMinutes}m';
    }
  }

  Color _getColor() {
    switch (course.color) {
      case '#6C5CE7':
        return const Color(0xFF6C5CE7);
      case '#00CEC9':
        return const Color(0xFF00CEC9);
      case '#FD79A8':
        return const Color(0xFFFF6B9D);
      default:
        return const Color(0xFF6C5CE7);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _getColor().withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: _getColor().withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'In ${_formatTime(course.nextClass)}',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: _getColor(),
                    ),
                  ),
                ),
                const Icon(
                  Icons.schedule,
                  size: 16,
                  color: Color(0xFF718096),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              course.title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2D3748),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text(
              course.instructor,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF718096),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  Icons.play_circle_outline,
                  size: 16,
                  color: _getColor(),
                ),
                const SizedBox(width: 4),
                Text(
                  'Join Class',
                  style: TextStyle(
                    fontSize: 12,
                    color: _getColor(),
                    fontWeight: FontWeight.bold,
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
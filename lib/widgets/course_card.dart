import 'package:flutter/material.dart';
import '../models/course.dart';
import 'progress_bar.dart';

class CourseCard extends StatelessWidget {
  final Course course;

  const CourseCard({super.key, required this.course});

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
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: _getColor().withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Icons.book,
                color: _getColor(),
                size: 24,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              course.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2D3748),
              ),
              maxLines: 2,
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
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${course.completedLessons}/${course.totalLessons}',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF718096),
                  ),
                ),
                Text(
                  '${(course.progress * 100).toInt()}%',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: _getColor(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            CustomProgressBar(
              progress: course.progress,
              color: _getColor(),
              backgroundColor: _getColor().withOpacity(0.1),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/foundation.dart';
import '../models/course.dart';
import '../services/api_service.dart';

class CourseProvider with ChangeNotifier {
  List<Course> _courses = [];
  bool _isLoading = false;

  List<Course> get courses => _courses;
  bool get isLoading => _isLoading;

  List<Course> get upcomingCourses {
    final now = DateTime.now();
    return _courses.where((course) => 
      course.nextClass.isAfter(now) && 
      course.nextClass.isBefore(now.add(const Duration(days: 7)))
    ).toList()..sort((a, b) => a.nextClass.compareTo(b.nextClass));
  }

  double get overallProgress {
    if (_courses.isEmpty) return 0.0;
    return _courses.map((c) => c.progress).reduce((a, b) => a + b) / _courses.length;
  }

  Future<void> fetchCourses() async {
    _isLoading = true;
    notifyListeners();
    
    try {
      _courses = await ApiService.fetchCourses();
    } catch (e) {
      print('Error fetching courses: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/course.dart';
import '../models/user.dart';

class ApiService {
  // Simulated API calls with dummy data
  
  static Future<User> login(String email, String password) async {
    // Simulate API delay
    await Future.delayed(const Duration(seconds: 2));
    
    // Dummy login - accepts any email/password
    if (email.isNotEmpty && password.isNotEmpty) {
      return User(
        id: '1',
        name: 'John Doe',
        email: email,
        avatar: 'JD',
      );
    }
    throw Exception('Invalid credentials');
  }

  static Future<List<Course>> fetchCourses() async {
    // Simulate API delay
    await Future.delayed(const Duration(seconds: 1));
    
    // Dummy course data
    final dummyData = [
      {
        'id': '1',
        'title': 'Flutter Development',
        'instructor': 'Dr. Sarah Johnson',
        'description': 'Learn to build beautiful mobile apps',
        'progress': 0.75,
        'color': '#6C5CE7',
        'nextClass': DateTime.now().add(const Duration(days: 2)).toIso8601String(),
        'totalLessons': 24,
        'completedLessons': 18,
      },
      {
        'id': '2',
        'title': 'UI/UX Design',
        'instructor': 'Prof. Mike Chen',
        'description': 'Master the art of user experience',
        'progress': 0.45,
        'color': '#00CEC9',
        'nextClass': DateTime.now().add(const Duration(days: 1)).toIso8601String(),
        'totalLessons': 20,
        'completedLessons': 9,
      },
      {
        'id': '3',
        'title': 'Data Structures',
        'instructor': 'Dr. Emily Rodriguez',
        'description': 'Fundamental computer science concepts',
        'progress': 0.90,
        'color': '#FD79A8',
        'nextClass': DateTime.now().add(const Duration(days: 3)).toIso8601String(),
        'totalLessons': 16,
        'completedLessons': 14,
      },
    ];
    
    return dummyData.map((json) => Course.fromJson(json)).toList();
  }
}
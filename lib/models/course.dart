class Course {
  final String id;
  final String title;
  final String instructor;
  final String description;
  final double progress;
  final String color;
  final DateTime nextClass;
  final int totalLessons;
  final int completedLessons;

  Course({
    required this.id,
    required this.title,
    required this.instructor,
    required this.description,
    required this.progress,
    required this.color,
    required this.nextClass,
    required this.totalLessons,
    required this.completedLessons,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      title: json['title'],
      instructor: json['instructor'],
      description: json['description'],
      progress: json['progress'].toDouble(),
      color: json['color'],
      nextClass: DateTime.parse(json['nextClass']),
      totalLessons: json['totalLessons'],
      completedLessons: json['completedLessons'],
    );
  }
}
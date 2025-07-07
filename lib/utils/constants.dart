class AppConstants {
  static const String appName = 'Student Dashboard';
  static const String appVersion = '1.0.0';
  
  // API URLs (for future use)
  static const String baseUrl = 'https://api.studentdashboard.com';
  static const String loginEndpoint = '/auth/login';
  static const String coursesEndpoint = '/courses';
  
  // Shared Preferences Keys
  static const String isLoggedInKey = 'isLoggedIn';
  static const String userEmailKey = 'userEmail';
  static const String userDataKey = 'userData';
  
  // Animation Durations
  static const int splashDuration = 3000;
  static const int animationDuration = 1500;
  static const int shortAnimationDuration = 500;
}
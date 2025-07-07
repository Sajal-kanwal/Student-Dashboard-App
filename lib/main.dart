import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'providers/auth_provider.dart';
import 'providers/course_provider.dart';
import 'screens/splash_screen.dart';
import 'utils/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => CourseProvider()),
      ],
      child: MaterialApp(
        title: 'Student Dashboard',
        theme: AppTheme.lightTheme,
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
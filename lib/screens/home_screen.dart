import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../providers/course_provider.dart';
import '../widgets/course_card.dart';
import '../widgets/progress_bar.dart';
import '../widgets/upcoming_class_card.dart';
import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> 
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    
    _animationController.forward();
    
    // Fetch courses when screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CourseProvider>(context, listen: false).fetchCourses();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Consumer<AuthProvider>(
          builder: (context, authProvider, child) {
            return Row(
              children: [
                CircleAvatar(
                  backgroundColor: const Color(0xFF6C5CE7),
                  child: Text(
                    authProvider.user?.avatar ?? 'U',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello, ${authProvider.user?.name ?? 'Student'}!',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2D3748),
                      ),
                    ),
                    const Text(
                      'Ready to learn today?',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF718096),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Color(0xFF718096)),
            onPressed: () {},
          ),
          PopupMenuButton(
            icon: const Icon(Icons.more_vert, color: Color(0xFF718096)),
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'logout',
                child: Row(
                  children: [
                    Icon(Icons.logout, color: Color(0xFF718096)),
                    SizedBox(width: 8),
                    Text('Logout'),
                  ],
                ),
              ),
            ],
            onSelected: (value) {
              if (value == 'logout') {
                Provider.of<AuthProvider>(context, listen: false).logout();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              }
            },
          ),
        ],
      ),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: RefreshIndicator(
          onRefresh: () async {
            await Provider.of<CourseProvider>(context, listen: false).fetchCourses();
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Overall Progress Section
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF6C5CE7),
                        Color(0xFF00CEC9),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF6C5CE7).withOpacity(0.3),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Overall Progress',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Consumer<CourseProvider>(
                            builder: (context, courseProvider, child) {
                              return Text(
                                '${(courseProvider.overallProgress * 100).toInt()}%',
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Consumer<CourseProvider>(
                        builder: (context, courseProvider, child) {
                          return CustomProgressBar(
                            progress: courseProvider.overallProgress,
                            color: Colors.white,
                            backgroundColor: Colors.white.withOpacity(0.3),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 30),
                
                // Upcoming Classes Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Upcoming Classes',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2D3748),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('View All'),
                    ),
                  ],
                ),
                
                const SizedBox(height: 15),
                
                Consumer<CourseProvider>(
                  builder: (context, courseProvider, child) {
                    if (courseProvider.isLoading) {
                      return SizedBox(
                        height: 120,
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: Color(0xFF6C5CE7),
                          ),
                        ),
                      );
                    }
                    
                    final upcomingCourses = courseProvider.upcomingCourses;
                    if (upcomingCourses.isEmpty) {
                      return SizedBox(
                        height: 120,
                        child: const Center(
                          child: Text(
                            'No upcoming classes',
                            style: TextStyle(
                              color: Color(0xFF718096),
                              fontSize: 16,
                            ),
                          ),
                        ),
                      );
                    }
                    
                    return SizedBox(
                      height: 120,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: upcomingCourses.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: UpcomingClassCard(
                              course: upcomingCourses[index],
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
                
                const SizedBox(height: 30),
                
                // My Courses Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'My Courses',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2D3748),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('View All'),
                    ),
                  ],
                ),
                
                const SizedBox(height: 15),
                
                Consumer<CourseProvider>(
                  builder: (context, courseProvider, child) {
                    if (courseProvider.isLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Color(0xFF6C5CE7),
                        ),
                      );
                    }
                    
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.85,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                      ),
                      itemCount: courseProvider.courses.length,
                      itemBuilder: (context, index) {
                        return CourseCard(
                          course: courseProvider.courses[index],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
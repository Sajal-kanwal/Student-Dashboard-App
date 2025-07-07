import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';
import '../services/api_service.dart';

class AuthProvider with ChangeNotifier {
  User? _user;
  bool _isLoading = false;
  bool _isLoggedIn = false;

  User? get user => _user;
  bool get isLoading => _isLoading;
  bool get isLoggedIn => _isLoggedIn;

  Future<void> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();
    
    try {
      _user = await ApiService.login(email, password);
      _isLoggedIn = true;
      
      // Save login state
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      await prefs.setString('userEmail', email);
      
    } catch (e) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    _user = null;
    _isLoggedIn = false;
    
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    
    notifyListeners();
  }

  Future<void> checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    _isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    
    if (_isLoggedIn) {
      final email = prefs.getString('userEmail') ?? '';
      _user = User(
        id: '1',
        name: 'John Doe',
        email: email,
        avatar: 'JD',
      );
    }
    
    notifyListeners();
  }
}
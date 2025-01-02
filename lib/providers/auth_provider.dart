import 'package:e_commerce/services/auth_service.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool? loginStatus;
  bool? signupStatus;

  SnackBar? loginSnackBar;
  SnackBar? signupSnackBar;

  Future<void> login({required String email, required String password}) async {
    try {
      loginStatus = await AuthService.login(email: email, password: password);
      loginSnackBar = SnackBar(
        content: Text(loginStatus! ? "Login Successfully" : "Login Failed"),
        backgroundColor: loginStatus! ? Colors.green : Colors.red,
      );
    } catch (e) {
      loginSnackBar = SnackBar(
        content: Text("An error occurred during login."),
        backgroundColor: Colors.red,
      );
      print("Login error: \$e");
    } finally {
      notifyListeners();
    }
  }

  Future<void> signup({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    try {
      signupStatus = await AuthService.signup(
        name: name,
        email: email,
        password: password,
        phone: phone,
      );
      signupSnackBar = SnackBar(
        content: Text(signupStatus! ? "Signup Successfully" : "Signup Failed"),
        backgroundColor: signupStatus! ? Colors.green : Colors.red,
      );
    } catch (e) {
      signupSnackBar = SnackBar(
        content: Text("An error occurred during signup."),
        backgroundColor: Colors.red,
      );
      print("Signup error: \$e");
    } finally {
      notifyListeners();
    }
  }
}
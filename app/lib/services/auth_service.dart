import 'dart:convert';
import 'api_service.dart';

class AuthService {

  // 🔐 REGISTER
  static Future<String> register({
    required String userName,
    required String password,
    required String phoneNumber,
    required String address,
    required String role,
  }) async {

    final response = await ApiService.post(
      "/public/register",
      {
        "userName": userName,
        "password": password,
        "phoneNumber": phoneNumber,
        "address": address,
        "role": role,
      },
      requireAuth: false,
    );

    if (response.statusCode == 200) {
      return "SUCCESS";
    } else if (response.statusCode == 403) {
      return "FORBIDDEN";
    } else {
      return "ERROR";
    }
  }

  // 🔐 LOGIN (you will adjust endpoint if needed)
  static Future<bool> login(String userName, String password) async {
    final response = await ApiService.post(
      "/auth/login",
      {
        "userName": userName,
        "password": password,
      },
      requireAuth: false,
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      // save token
      await ApiService.storage.write(
        key: "jwt",
        value: data["token"],
      );

      return true;
    } else {
      return false;
    }
  }

  // 🚪 LOGOUT
  static Future<void> logout() async {
    await ApiService.storage.delete(key: "jwt");
  }
}
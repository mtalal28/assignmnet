import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier {

  Future<void> login(String email, String password) async {
    const String url = 'https://conciergebooking.tijarah.ae/api/user/login';

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        print('Login successful: $responseData');
        // Handle successful login logic here
      } else {
        final responseData = json.decode(response.body);
        final errorMessage = responseData['message'] ?? 'Unknown error occurred';
        throw Exception('Failed to login: $errorMessage');
      }
    } catch (e) {
      print('Error during login: $e');
      throw Exception('Failed to login: $e');
    }
  }


  Future<void> register({
    required String type,
    required String userId,
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNumber,
    required String waNumber,
    required String phoneCode,
    required String waCode,
    required String mobileCode,
    required String password,
    required String confirmPassword,
    required String address,
    required String locationCoordinates,
    required String referralCode,
    required String cuisineId,
    required String mobileNumber,
    required String country,
    required String state,
    required String city,
  }) async {
    final response = await http.post(
      Uri.parse('https://conciergebooking.tijarah.ae/api/user/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'type': type,
        'userId': userId,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'phoneNumber': phoneNumber,
        'waNumber': waNumber,
        'phoneCode': phoneCode,
        'waCode': waCode,
        'mobileCode': mobileCode,
        'password': password,
        'confirmPassword': confirmPassword,
        'address': address,
        'locationCoordinates': locationCoordinates,
        'referralCode': referralCode,
        'cuisineId': cuisineId,
        'mobileNumber': mobileNumber,
        'country': country,
        'state': state,
        'city': city,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to register: ${response.body}');
    }
  }
}

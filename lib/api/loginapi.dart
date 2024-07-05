// import 'package:dio/dio.dart';
//
// Future<int?> loginUser(String email,String pass) async {
//   // Instantiate Dio
//   Dio dio = Dio();
//
//   // Define the API URL
//   String apiUrl = 'https://job-backend-skpz.onrender.com/login/';
//
//   try {
//     // Make the POST request
//     Response response = await dio.post(
//       apiUrl,
//       data: {
//         "email": email,
//         "password": pass
//       },
//       options: Options(headers: {
//         'Content-Type': 'application/json',
//       }),
//     );
//
//     // Handle response
//     if (response.statusCode == 200) {
//       // Request successful, do something with the response
//       print('Login successful');
//       // Access response data
//       print(response.data);
//       return response.data['userId'];
//     } else {
//       // Request failed
//       print('Failed to login: ${response.statusCode}');
//       return null;
//     }
//   } catch (e) {
//     // Error occurred
//     print('Error logging in: $e');
//     return null;
//   }
// }
import 'dart:io';

import 'package:dio/dio.dart';

Future<int?> loginUser(String email, String pass) async {
  // Instantiate Dio
  Dio dio = Dio();

  // Define the API URL
  String apiUrl = 'https://job-backend-skpz.onrender.com/login/';

  try {
    // Make the POST request
    Response response = await dio.post(
      apiUrl,
      data: {
        "email": email,
        "password": pass,
      },
      options: Options(headers: {
        'Content-Type': 'application/json',
      }),
    );

    // Handle response
    if (response.statusCode == 200) {
      // Request successful, do something with the response
      print('Login successful');
      // Access response data safely
      var data = response.data;
      if (data != null && data['userId'] != null) {
        return data['userId'];
      } else {
        print('Invalid response data');
        return null;
      }
    } else {
      // Request failed
      print('Failed to login: ${response.statusCode}');
      return null;
    }
  } catch (e) {
    // Error occurred
    if (e is DioError) {
      if (e.type == DioErrorType.other && e.error is SocketException) {
        print('Network error: ${e.error}');
      } else {
        print('Dio error: ${e.message}');
      }
    } else {
      print('Unexpected error: $e');
    }
    return null;
  }
}

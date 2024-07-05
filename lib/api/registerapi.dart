
import 'package:dio/dio.dart';


Future<void> registerUser(String accountype,String first,String last,String username,String email,String phone,String pass) async {
  // Instantiate Dio
  Dio dio = Dio();

  // Define the API URL
  String apiUrl = 'https://job-backend-skpz.onrender.com/registration/';

  try {
    // Make the POST request
    Response response = await dio.post(
      apiUrl,
      data: {
        "accountType": accountype,
        "firstName": first,
        "lastName": last,
        "userName": username,
        "email": email,
        "phone": phone,
        "password": pass
      },
      options: Options(headers: {
        'Content-Type': 'application/json',
      }),
    );

    // Handle response
    if (response.statusCode == 200) {
      // Request successful, do something with the response
      print('Registration successful');
    } else {
      // Request failed
      print('Failed to register: ${response.statusCode}');
    }
  } catch (e) {
    // Error occurred
    print('Error registering user: $e');
  }
}

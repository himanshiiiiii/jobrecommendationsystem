import 'package:dio/dio.dart';

void updatePreference(String id,List<String>skills,List<String>titles,String level,List<String>locations) async {
  var dio = Dio();
  var url = 'https://job-backend-skpz.onrender.com/updatePreference/';

  try {
    var response = await dio.put(
      url,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
      data: {
        "userId":id,
        "skills": skills,
        "jobTitles": titles,
        "experienceLevel": level,
        "locations": locations
      },
    );

    if (response.statusCode == 200) {
      print('Preferences updated successfully');
    } else {
      print('Failed to update preferences');
    }
  } catch (e) {
    print('Error: $e');
  }
}
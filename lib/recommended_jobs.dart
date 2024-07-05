// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// class RecommendedJobsScreen extends StatefulWidget {
//   final int userID;
//   const RecommendedJobsScreen({Key? key,required this.userID}) : super(key: key);
//   @override
//   _RecommendedJobsScreenState createState() => _RecommendedJobsScreenState();
// }
//
// class _RecommendedJobsScreenState extends State<RecommendedJobsScreen> {
//   List<Map<String, dynamic>> recommendedJobs = [];
//
//   @override
//   void initState() {
//     super.initState();
//     fetchRecommendedJobs();
//   }
//
//   Future<void> fetchRecommendedJobs() async {
//     final response = await http.post(
//       Uri.parse('https://job-backend-skpz.onrender.com/recommend'),
//       headers: <String, String>{'Content-Type': 'application/json'},
//       body: jsonEncode(<String, int>{'userId': userId}),
//     );
//
//     if (response.statusCode == 200) {
//       final Map<String, dynamic> data = jsonDecode(response.body);
//       setState(() {
//         recommendedJobs = List<Map<String, dynamic>>.from(data['recommendedJobs'].values);
//       });
//     } else {
//       throw Exception('Failed to fetch recommended jobs');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Recommended Jobs'),
//       ),
//       body: recommendedJobs.isEmpty
//           ? Center(
//         child: CircularProgressIndicator(),
//       )
//           : ListView.builder(
//         itemCount: recommendedJobs.length,
//         itemBuilder: (context, index) {
//           final job = recommendedJobs[index];
//           return Container(
//             padding: EdgeInsets.all(12),
//             margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(8),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.2),
//                   spreadRadius: 2,
//                   blurRadius: 5,
//                   offset: Offset(0, 2),
//                 ),
//               ],
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   job['jobTitle'],
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 4),
//                 Text(
//                   job['companyName'],
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.grey,
//                   ),
//                 ),
//                 SizedBox(height: 8),
//                 Text(
//                   'Location: ${job['jobLocation']}',
//                   style: TextStyle(
//                     fontSize: 16,
//                   ),
//                 ),
//                 SizedBox(height: 8),
//                 Text(
//                   'Salary: ${job['jobSalary']}',
//                   style: TextStyle(
//                     fontSize: 16,
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//

//
// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
//
// class RecommendedJobs extends StatefulWidget {
//   final int userID;
//
//   const RecommendedJobs({Key? key, required this.userID}) : super(key: key);
//
//   @override
//   _RecommendedJobsState createState() => _RecommendedJobsState();
// }
//
// class _RecommendedJobsState extends State<RecommendedJobs> {
//   List<Map<String, dynamic>> recommendedJobs = [];
//
//   @override
//   void initState() {
//     super.initState();
//     fetchRecommendedJobs();
//   }
//
//   Future<void> fetchRecommendedJobs() async {
//     var dio = Dio();
//     var url = 'https://job-backend-skpz.onrender.com/recommend';
//
//     try {
//       var response = await dio.post(
//         url,
//         options: Options(
//           headers: {
//             'Content-Type': 'application/json',
//           },
//         ),
//         data: {
//           "userId": widget.userID,
//         },
//       );
//       print(widget.userID);
//
//       if (response.statusCode == 200) {
//         var data = response.data['recommendedJobs'] as Map<String, dynamic>;
//         print(data);
//         setState(() {
//           recommendedJobs = data.values.toList().cast<Map<String, dynamic>>();
//           print(recommendedJobs);
//         });
//       } else {
//         print('Failed to fetch recommended jobs');
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Recommended Jobs'),
//       ),
//       body: recommendedJobs.isEmpty
//           ? Center(
//         child: CircularProgressIndicator(),
//       )
//           : ListView.builder(
//         itemCount: recommendedJobs.length,
//         itemBuilder: (context, index) {
//           var job = recommendedJobs[index];
//           return ListTile(
//             title: Text(job['jobTitle']),
//             subtitle: Text(job['companyName']),
//             onTap: () {
//               // Handle tapping on the job item
//             },
//           );
//         },
//       ),
//     );
//   }
// }
// import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

import 'models.dart';

class RecommendedJobsScreen extends StatefulWidget {
  final int userID;

  const RecommendedJobsScreen({Key? key, required this.userID})
      : super(key: key);

  @override
  _RecommendedJobsScreenState createState() => _RecommendedJobsScreenState();
}

class _RecommendedJobsScreenState extends State<RecommendedJobsScreen> {
  late Future<RecommendedJobsResponse> _future;

  @override
  void initState() {
    super.initState();
    _future = fetchRecommendedJobs();
  }

  Future<RecommendedJobsResponse> fetchRecommendedJobs() async {
    var dio = Dio();
    var url = 'https://job-backend-skpz.onrender.com/recommend';

    try {
      var response = await dio.post(url,
          data: jsonEncode(
            {"userId": 1000},
          ));
      print(response);

      if (response.statusCode == 200) {
        return RecommendedJobsResponse.fromJson(response.data);
      } else {
        throw Exception('Failed to load recommended jobs');
      }
    } catch (e) {
      print("ayush");
      print('Error: $e');
      throw Exception('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recommended Jobs'),
      ),
      body: FutureBuilder<RecommendedJobsResponse>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.recommendedJobs.length,
              itemBuilder: (context, index) {
                var job = snapshot.data!.recommendedJobs.values.toList()[index];
                return
                  Column(
                    children: [
                      Card(
                        elevation: 3,
                        margin: EdgeInsets.only(left: 10 , right: 5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          height: 240,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top:10),
                                    width: 100,
                                    height: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      // Optional: Adjust border radius
                                      image: DecorationImage(
                                        image: AssetImage('assets/tier-2-5g-phone-sales-help-amazon-india-clock-double-digit-q1-growth.webp'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 10 , top: 10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          job.jobTitle,
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff383838),
                                          ),
                                        ),
                                        Text(
                                          job.companyName,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xff383838),
                                          ),
                                        ),

                                        SizedBox(height: 4),
                                        Text(
                                          ' ${job.jobSkills}',
                                          style: TextStyle(fontSize: 16, color: Colors.blue),
                                        ),
                                        SizedBox(height: 4),
                                        // Flexible(
                                        //   child: Text(
                                        //     'Experience : ${job.jobExperienceLevel}',
                                        //     maxLines: 1,
                                        //     style: TextStyle(fontSize: 16, color: Colors.grey),
                                        //   ),
                                        // ),
                                        SizedBox(height: 20),
                                        Center(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.location_on,
                                                size: 16,
                                                color: Colors.black,
                                              ),
                                              SizedBox(width: 4),
                                              Text(
                                                job.jobLocation,
                                                style: TextStyle(fontSize: 16, color: Colors.black),
                                              ),
                                            ],
                                          ),
                                        ),

                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20), // Adjust the value to change the roundness
                                      border: Border.all(
                                        color: Colors.grey, // Border color
                                        width: 1, // Border width
                                      ),
                                    ),
                                    child:Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        ' ${job.jobExperienceLevel} ',
                                        style: TextStyle(fontSize: 12, color: Colors.black54),
                                      ),
                                    ),

                                  ),
                                  SizedBox(width: 15,),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20), // Adjust the value to change the roundness
                                      border: Border.all(
                                        color: Colors.grey, // Border color
                                        width: 1, // Border width
                                      ),
                                    ),
                                    child:Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        '   ${job.jobType}    ',
                                        style: TextStyle(fontSize: 12, color: Colors.black54),
                                      ),
                                    ),

                                  ),
                                  SizedBox(width: 40,),
                                  ElevatedButton(
                                    onPressed: () {
                                      // Add your button onPressed logic here
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue, // Blue color
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15), // Adjust the value to change the roundness
                                      ),
                                    ),
                                    child: Text(
                                      'Apply',
                                      style: TextStyle(fontSize: 14,color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  );

              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error'),
            );
          } else {
            return Center(
              child: Text('No data available'),
            );
          }
        },
      ),
    );
  }
}

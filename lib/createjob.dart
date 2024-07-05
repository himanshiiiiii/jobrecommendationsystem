import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class JobApplicationForm extends StatefulWidget {
  @override
  _JobApplicationFormState createState() => _JobApplicationFormState();
}

class _JobApplicationFormState extends State<JobApplicationForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController company=TextEditingController();
  TextEditingController jobdes=TextEditingController();
  TextEditingController jobsal=TextEditingController();
  String?_companyName;
  String ?_jobDescription;
  String ?_jobSalary;
  String?_selectedjobtitle;
  String ?_selectedJobType;
  String ?_selectedJobExperienceLevel;
  String ?_selectedJobLocation;
  String ?_selectedJobSkill;
  List<String> _selectedJobSkills = [];
  List<String>_jobTitle=['Software Engineer',
    'Web Developer',
    'Mobile Developer',
    'Data Scientist',
    'Data Analyst',
    'Backend Developer',
    'Full Stack Developer',
    'Project Manager',];
  List<String> _jobTypes = ['Remote','On-Site','Hybrid'];
  List<String> _jobExperienceLevels = ['Fresher', 'Intermediate', 'Senior Level'];
  List<String> _jobLocations = ['Delhi',
    'Bangalore',
    'Hyderabad',
    'Chennai',
    'Kolkata',
    'Pune',];
  List<String> _jobSkills = ['Python', 'JavaScript',
    'HTML',
    'Java',
    'React',
    'Angular',
    'Node.js',
    'MongoDB',
    'Firebase',
    'Flutter',];
  bool _isLoading = false;
  void senddata () async {

      // Show CircularProgressIndicator
      setState(() {
        _isLoading = true;
      });
    var headers = {
      'Content-Type': 'application/json'
    };
    var data = json.encode({
      "companyName": _companyName,
      "jobTitle": _selectedjobtitle ,
      "jobType":  _selectedJobType,
      "jobSkills":_selectedJobSkills,


      "jobDescription": _jobDescription,
      "jobExperienceLevel": _selectedJobExperienceLevel,
      "jobLocation":_selectedJobLocation,
      "jobSalary": _jobSalary,
    });
    var dio = Dio();
    var response = await dio.request(
      'https://job-backend-skpz.onrender.com/createJobPost/',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      print(response.statusCode);
      print(json.encode(response.data));
       
      Navigator.pop(context);
      setState(() {
        _companyName = null;
        _selectedjobtitle = null;
        _selectedJobType = null;
        _selectedJobSkills.clear();
        _jobDescription = null;
        _selectedJobExperienceLevel = null;
        _selectedJobLocation = null;
        _jobSalary = null;
        company.clear();
        jobdes.clear();
        jobsal.clear();
      });

    }
    else {
      print(response.statusMessage);
    }

  }
  //   await Future.delayed(Duration(seconds: 3));
  //
  //   if (response.statusCode == 200) {
  //     print(response.statusCode);
  //     print(json.encode(response.data));
  //     setState(() {
  //       _companyName = null;
  //       _selectedjobtitle = null;
  //       _selectedJobType = null;
  //       _selectedJobSkills.clear();
  //       _jobDescription = null;
  //       _selectedJobExperienceLevel = null;
  //       _selectedJobLocation = null;
  //       _jobSalary = null;
  //       company.clear();
  //       jobdes.clear();
  //       jobsal.clear();
  //       _isLoading = false; // Hide CircularProgressIndicator
  //     });
  //
  //     // Navigate to the homepage
  //     // Navigator.pop(context);
  //   } else {
  //     print(response.statusMessage);
  //     _isLoading = false; // Hide CircularProgressIndicator
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height*0.08), // Adjust the height as needed
        child: AppBar(
          automaticallyImplyLeading: false,
          title: Row(children: [
            Padding(
              padding: const EdgeInsets.only(top:8.0,left: 8,right: 8),
              child: Image.asset("assets/unstop.png",height: size.height*0.08,width: size.width*0.24,fit:BoxFit.contain,),
            ),
          ],),
        ),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only( left: 15,right: 15),
          child: Column(
            children: [
              Text('Create Job Post',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),),
              Form(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.only(top:20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Company Name',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: company,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7.0),
                            borderSide: BorderSide(width: 1.0),
                          ),),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter company name';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _companyName = value;
                        },
                      ),
                      SizedBox(height: 20),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(labelText: 'Job Title'),
                        value: _selectedjobtitle,
                        items: _jobTitle.map((jobtitle) {
                          return DropdownMenuItem<String>(
                            value: jobtitle,
                            child: Text(jobtitle),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedjobtitle = value;
                          });
                        },
                      ),
                      SizedBox(height: 20),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(labelText: 'Job Type'),
                        value: _selectedJobType,
                        items: _jobTypes.map((jobType) {
                          return DropdownMenuItem<String>(
                            value: jobType,
                            child: Text(jobType),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedJobType = value;
                          });
                        },
                      ),
                      SizedBox(height: 20),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(labelText: 'Job Experience Level'),
                        value: _selectedJobExperienceLevel,
                        items: _jobExperienceLevels.map((experienceLevel) {
                          return DropdownMenuItem<String>(
                            value: experienceLevel,
                            child: Text(experienceLevel),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedJobExperienceLevel = value;
                          });
                        },
                      ),
                      SizedBox(height: 20),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(labelText: 'Job Location'),
                        value: _selectedJobLocation,
                        items: _jobLocations.map((location) {
                          return DropdownMenuItem<String>(
                            value: location,
                            child: Text(location),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedJobLocation = value;
                          });
                        },
                      ),
                      SizedBox(height: 20),
                      Text('Job Description',style: TextStyle(
                          fontSize: 16
                      ),),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: jobdes,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1, color: Colors.black87),
                          ),),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter job description';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _jobDescription = value;
                        },
                      ),
                      SizedBox(height: 20),
                      Text('Job Skills', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: _jobSkills.map((skill) {
                          return CheckboxListTile(
                            title: Text(skill),
                            value: _selectedJobSkills.contains(skill),
                            onChanged: (bool? value) {
                              setState(() {
                                if (value!) {
                                  _selectedJobSkills.add(skill);
                                } else {
                                  _selectedJobSkills.remove(skill);
                                }
                              });
                            },
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Job Salary',
                        style: TextStyle(
                          fontSize: 16,
                        ),

                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: jobsal,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1, color: Colors.black87), //<-- SEE HERE
                          ),),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter job salary';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _jobSalary = value;
                        },
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: ElevatedButton(
                            onPressed:()   {
                              // showDialog(
                              //   context: context,
                              //   builder: (BuildContext context) {
                              //     return Center(
                              //       child: CircularProgressIndicator(),
                              //     );
                              //   },
                              // );
                              //
                              // // Simulate a delay of 3 seconds
                              //   Future.delayed(Duration(seconds: 3));
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                senddata();
                              }
                            }, style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),

                        ),
                            child: Text('SUBMIT',style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),)),
                      )


                    ],

                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
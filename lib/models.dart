class RecommendedJobsResponse {
  final Map<String, RecommendedJob> recommendedJobs;

  RecommendedJobsResponse({required this.recommendedJobs});

  factory RecommendedJobsResponse.fromJson(Map<String, dynamic> json) {
    Map<String, RecommendedJob> recommendedJobsMap = {};
    json['recommendedJobs'].forEach((key, value) {
      recommendedJobsMap[key] = RecommendedJob.fromJson(value);
    });
    return RecommendedJobsResponse(recommendedJobs: recommendedJobsMap);
  }
}

class RecommendedJob {
  final String id;
  final int jobId;
  final String companyName;
  final String jobTitle;
  final String jobType;
  final List<String> jobSkills;
  final String jobDescription;
  final String jobExperienceLevel;
  final String jobLocation;
  final String jobSalary;
  final int v;

  RecommendedJob({
    required this.id,
    required this.jobId,
    required this.companyName,
    required this.jobTitle,
    required this.jobType,
    required this.jobSkills,
    required this.jobDescription,
    required this.jobExperienceLevel,
    required this.jobLocation,
    required this.jobSalary,
    required this.v,
  });

  factory RecommendedJob.fromJson(Map<String, dynamic> json) {
    return RecommendedJob(
      id: json['_id'],
      jobId: json['jobId'],
      companyName: json['companyName'],
      jobTitle: json['jobTitle'],
      jobType: json['jobType'],
      jobSkills: List<String>.from(json['jobSkills']),
      jobDescription: json['jobDescription'],
      jobExperienceLevel: json['jobExperienceLevel'],
      jobLocation: json['jobLocation'],
      jobSalary: json['jobSalary'],
      v: json['__v'],
    );
  }
}

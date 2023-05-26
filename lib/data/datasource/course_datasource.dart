import 'package:dio/dio.dart';
import 'package:elearning/core/values/urls.dart';
import 'package:elearning/data/services/dio_client.dart';
import '../model/course_response.dart';

class CourseDataSource{
  final DioClient _client;

  const CourseDataSource(this._client);

  Future<List<CourseData>?> getCourse({
    required String majorName,
    required String userEmail,
  }) async{
    try{
      //define path
      final urlPath =
          '${Urls.courseList}?major_name=$majorName&user_email=$userEmail';

      //Get response
      final response = await _client.get(urlPath);

      //Parsing response
      final dataResponse = CourseDataResponse.fromJson(response);

      //mengambil data yg diinginkan
      final courseData =dataResponse.data;

      //return/kembalikan data yang diingkan
      return courseData;
    }on Exception catch (e, stracktrace){
      print('Error on course data: $e: $stracktrace');
      rethrow;
    }
  }
}
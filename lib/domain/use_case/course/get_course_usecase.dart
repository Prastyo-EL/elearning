// import 'package:elearning/data/model/course_response.dart';
//
// import '../../../data/repository/course_repository.dart';
// import '../../repository/course_repository.dart';
//
// class GetCourseUseCase{
//   final CourseRepository _repository;
//
//   const GetCourseUseCase(this._repository);
//   Future<List<CourseData>?> call({
//     required String majorName,
//     required String userEmail,
//   })async{
//     try{
//       return _repository.getCourse(majorName: majorName,userEmail:userEmail);
//     }catch (e, stracktrace){
//       print('Error on Use Case : $e: $stracktrace');
//       rethrow;
//     }
//   }
// }
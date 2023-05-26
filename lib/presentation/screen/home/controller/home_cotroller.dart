// import 'package:elearning/data/model/course_response.dart';
// import 'package:elearning/domain/use_case/course/get_course_usecase.dart';
// import 'package:get/get.dart';
//
// enum CourseDataStatus{ initial, loading,success,error}
//
// class CourseDataStatusModel{
//   final CourseDataStatus status;
//   final String? detail;
//
//   const CourseDataStatusModel({required this.status, this.detail});
// }
// class HomeController extends GetxController{
//   final GetCourseUseCase _getCourseUseCase;
//
//   HomeController(this._getCourseUseCase);
//
//   Rx<List<CourseData>> courseData=Rx([]);
//   Rx<CourseDataStatusModel> courseDataStatus = Rx(const CourseDataStatusModel(status: CourseDataStatus.initial, ));
//
//   void getCourse({
//     required String majorName,
//     required String userEmail,
//   })async{
//     try{
//       courseDataStatus(const CourseDataStatusModel(status: CourseDataStatus.loading));
//       update();
//
//       final result = await _getCourseUseCase.call(majorName: majorName,userEmail:userEmail);
//       courseData(result);
//       courseDataStatus(const CourseDataStatusModel(status: CourseDataStatus.success));
//       update();
//     }catch(e){
//       courseDataStatus(CourseDataStatusModel(status: CourseDataStatus.error,detail: e.toString()));
//       update();
//     }
//   }
//
// }
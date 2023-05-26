// import 'package:elearning/data/datasource/course_datasource.dart';
// import 'package:elearning/data/repository/course_repository.dart';
// // import 'package:elearning/data/services/dio_client.dart';
// import 'package:elearning/domain/use_case/course/get_course_usecase.dart';
// import 'package:flutter/foundation.dart';
// import 'package:get/get.dart';
// import 'package:elearning/data/services/dio_client.dart';
//
// import '../../domain/repository/course_repository.dart';
// import '../screen/home/controller/home_cotroller.dart';
//
// class HomeBindings implements Bindings{
//
//
//   @override
//   void dependencies() {
//     Get.lazyPut<DioClient>(()=> DioClientImpl());
//     Get.lazyPut<CourseDataSource>(
//           () => CourseDataSource(Get.find<DioClient>()),
//     );
//     Get.lazyPut<CourseRepository>(
//             () => CourseRepositoryImpl(Get.find<CourseDataSource>()),
//     );
//     Get.lazyPut<GetCourseUseCase>(
//     () => GetCourseUseCase(Get.find<CourseRepository>()),
//     );
//     Get.lazyPut<HomeController>(
//     () => HomeController(Get.find<GetCourseUseCase>()),
//     );
//   }
//
// }
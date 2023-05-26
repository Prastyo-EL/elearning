// import 'package:elearning/presentation/screen/home/controller/home_cotroller.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// import '../../../dashboard/home/home_controller.dart';
// import '../../../widgets/course_card.dart';
//
// class MoreCourse extends StatelessWidget {
//    MoreCourse({Key? key});
//   final controller = Get.find<HomeController>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView.separated(
//           itemCount: controller.courseList.length,
//           shrinkWrap: true,
//         separatorBuilder: ( context,  index) =>
//         const SizedBox(height: 8,),
//           itemBuilder: (context,index ){
//         final data = controller.courseList[index];
//         return CourseCard(
//           iconUrl: data.urlCover??'',
//           courseName: data.courseName??'',
//           jumlahDone: data.jumlahDone?? 0,
//           jumlahMateri: data.jumlahMateri??0,
//         );
//       },
//       ),
//     );
//   }
// }

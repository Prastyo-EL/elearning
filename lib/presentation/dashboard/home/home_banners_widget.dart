// import 'package:elearning/data/model/banner_response.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// import 'home_controller.dart';
//
// class HomeBannersWidget extends StatefulWidget {
//   const HomeBannersWidget({Key? key}) : super(key: key);
//
//   @override
//   State<HomeBannersWidget> createState() => _HomeBannersWidgetState();
// }
//
// class _HomeBannersWidgetState extends State<HomeBannersWidget> {
//   @override
//   void initState() {
//     Get.find<HomeController>().getBanners();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<HomeController>(
//       builder: (controller) {
//         List<BannerData> banner = controller.courseList;
//
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             if (courses.length > controller.maxHomeCourseCount)
//               TextButton(
//                 child: const Text('Lihat Semua'),
//                 onPressed: () {
//                   Get.toNamed(Routes.courseList);
//                 },
//               ),
//             LinearProgressIndicator(
//               value: 0.8,
//               minHeight: 5,
//               backgroundColor: Colors.black,
//             ),
//             if (controller.isGetCoursesLoading == true)
//               const Center(child: CircularProgressIndicator())
//             else
//               ListView.builder(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemCount:
//                 courses.length > controller.maxHomeCourseCount ? controller.maxHomeCourseCount : courses.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text(courses[index].courseName ?? ''),
//                     onTap: () {
//                       Get.toNamed(
//                         Routes.exerciseList,
//                         arguments: ExerciseListPageArgs(
//                           courseId: courses[index].courseId!,
//                           courseName: courses[index].courseName ?? '',
//                         ),
//                       );
//                     },
//                   );
//                 },
//               ),
//           ],
//         );
//       },
//     );
//   }
// }

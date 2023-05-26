import 'package:elearning/data/model/course_response.dart';
import 'package:elearning/presentation/course/course_list_controller.dart';
import 'package:elearning/presentation/widgets/course_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';
import '../exercise/list/exercise_list_page.dart';

class CourseListPage extends GetView<CourseListController> {
   CourseListPage({Key? key}) : super(key: key);
  final _controller = Get.find<CourseListController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Semua Mata Pelajaran'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // TODO: Call API getCourses()
          return Future<void>.delayed(const Duration(seconds: 3));
        },
        child: GetBuilder<CourseListController>(
          init: _controller,
          initState: (state)=> _controller.getCourses(),
          builder: (_controller) {
            // final course= _controller.courseList;
            // List<CourseData> courses = courseController.courseList;
            return ListView.separated(
              itemCount: _controller.courseList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final data = _controller.courseList[index];
                return ListTile(
                  title: CourseCard(
                    iconUrl: data.urlCover??'',
                    courseName: data.courseName??'',
                    jumlahDone: data.jumlahDone??0,
                    jumlahMateri: data.jumlahMateri??0,
                  ),
                  onTap: (){
                  Get.toNamed(
                    Routes.exerciseList,
                    arguments: ExerciseListPageArgs(
                      courseId: data.courseId!,
                      courseName: data.courseName ?? '',
                  ),
                  );
                },
                );
              }, separatorBuilder: ( context,  index) =>
            const SizedBox(height: 8,),
            );
          },
        ),
      ),
    );
  }
}
//   title: Text(courses[index].courseName ?? ''),
//   onTap: () {
//     Get.toNamed(
//       Routes.exerciseList,
//       arguments: ExerciseListPageArgs(
//         courseId: courses[index].courseId!,
//         courseName: courses[index].courseName ?? '',
//       ),
//     );
//   },
// );
import 'package:elearning/data/model/course_response.dart';
import 'package:elearning/presentation/course/course_list_controller.dart';
import 'package:elearning/presentation/dashboard/home/home_courses_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/routes.dart';
import '../../exercise/list/exercise_list_page.dart';
import '../../widgets/course_card.dart';
import 'home_controller.dart';


class HomePage extends StatelessWidget {
   HomePage({Key? key});
  final _controller = Get.find<HomeController>();
  @override
    Widget build(BuildContext context){
    return Scaffold(
      body: GetBuilder<HomeController>(
        init: _controller,
        initState: (state)=> _controller.getCourses(),
        builder: (controller) {
          final statusData = _controller.courseDataStatus.value;
          print(statusData.status.toString());

          if (statusData.status == CourseDataStatus.loading) {
            return Center(child: CircularProgressIndicator());
          }
          if (statusData.status == CourseDataStatus.error) {
            return Center(child: Text(statusData.detail ?? 'Empty Data'));
          }
          if (statusData.status == CourseDataStatus.success) {
            final course= _controller.courseList;
            if(course.length==0){
              return Center(child: Text('Empty Data'));
            }
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Pilih Pelajaran',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                          ),
                        ),
                        TextButton(onPressed: (){
                          Get.toNamed(Routes.courseList);
                        }, child: Text('Lihat Semua'))
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    ListView.separated(
                      itemCount: _controller.courseList.length>3?3:_controller.courseList.length,
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
                    ),
                  ],
                ),
              ),
            );
          }
          return Center(child: Text('Encaught Error '));
        }
      )

    );
  }


  Widget _mobileWidget() {
    return Container();
  }

  Widget _tabletWidget() {
    return Container();
  }

  Widget _landscapeWidget() {
    return Container();
  }
}

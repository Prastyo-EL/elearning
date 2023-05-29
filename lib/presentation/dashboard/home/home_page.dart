import 'dart:convert';

import 'package:elearning/data/model/course_response.dart';
import 'package:elearning/data/model/user_response.dart';
import 'package:elearning/presentation/course/course_list_controller.dart';
import 'package:elearning/presentation/dashboard/home/home_courses_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../core/values/images.dart';
import '../../../data/services/firebase_auth_service.dart';
import '../../../routes/routes.dart';
import '../../exercise/list/exercise_list_page.dart';
import '../../widgets/course_card.dart';
import 'home_controller.dart';


class HomePage extends StatefulWidget {
  HomePage({Key? key});

  //  HomePage({Key? key}) : super(key: key);


  State<HomePage> createState() => _HomePageState();

}
class _HomePageState extends State<HomePage> {
  final _controller = Get.find<HomeController>();
  @override
  void initState() {
    super.initState();
    // Call API

    _HomePageState();
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: buildAppBar(context),
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
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(24.0),
                                child: SvgPicture.asset(
                                  ImagesAssets.kerjakan,
                                  height: 60,

                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(24.0),

                                child: SvgPicture.asset(
                                  ImagesAssets.gambar,
                                  height: 100,

                                ),
                              ),
                            ],

                          ),

                        ),
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

   PreferredSizeWidget buildAppBar(BuildContext context) {
     return AppBar(
       // title: const Text(''),
       backgroundColor: Colors.white,
       centerTitle: true,
       bottom: buildBottomAppBar(context),
       // shape: const RoundedRectangleBorder(
       //   borderRadius: BorderRadius.only(
       //     bottomLeft: Radius.circular(16),
       //     bottomRight: Radius.circular(16),
       //   ),
       // ),
     );
   }

   PreferredSizeWidget buildBottomAppBar(BuildContext context) {
   //   UserData use = FirebaseAuth.instance.currentUser?.displayName as UserData;
   //  var usa = jsonEncode(use.toJson());
   //   Map<String, dynamic> valueMap = jsonDecode(usa);
   //   String user = valueMap.toString();
   //   //user.userEmail.toString();
   //
   //   //print(user);
     return PreferredSize(
       preferredSize: Size(Get.width, 30),
       child: Row(
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           Expanded(
             child: Padding(
               padding: const EdgeInsets.all(16.0),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children:  [
                   Text(
                     'Hai',
                     style: TextStyle(
                       fontSize: 16,
                       color: Colors.black,
                     ),
                   ),
                   SizedBox(
                     height: 8,
                   ),
                   Text(
                     'Selamat Datang',
                     style: TextStyle(
                       fontSize: 16,
                       color: Colors.black,
                     ),
                   ),
                 ],
               ),
             ),
           ),
           ClipRRect(
             borderRadius: BorderRadius.circular(36),
             child: Image.network(
               'https://cdn1-production-images-kly.akamaized.net/H6frj65JGbLKYO7MVWUlp3tD8tc=/1200x1200/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/2117358/original/087611600_1524566686-2._Steve_Jobs_-_JUSTIN_SULLIVAN__GETTY_IMAGES_NORTH_AMERICA__AFP.jpg',
               width: 50,
               height: 50,
               fit: BoxFit.cover,
             ),
           ),
           //const SizedBox(width: 16),
         ],
       ),
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


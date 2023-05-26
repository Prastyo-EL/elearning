// import 'package:elearning/presentation/screen/home/controller/home_cotroller.dart';
// import 'package:elearning/presentation/widgets/course_card.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/get_core.dart';
//
// import '../../../../core/values/page_route_name.dart';
//
// class HomePage extends StatelessWidget{
//    HomePage({super.key});
//
//   final _controller = Get.find<HomeController>();
//
//   @override
//   Widget build(BuildContext context){
//     return Scaffold(
//       body: GetBuilder<HomeController>(
//         init: _controller,
//         initState: (state)=> _controller.getCourse(
//             majorName: 'IPA',
//             userEmail: 'testerngbayu@gmail.com'),
//         builder: (controller) {
//           final statusData = _controller.courseDataStatus.value;
//           print(statusData.status.toString());
//
//           if (statusData.status == CourseDataStatus.loading) {
//             return Center(child: CircularProgressIndicator());
//           }
//           if (statusData.status == CourseDataStatus.error) {
//             return Center(child: Text(statusData.detail ?? 'Empty Data'));
//           }
//           if (statusData.status == CourseDataStatus.success) {
//             final course= _controller.courseData.value;
//             if(course.length==0){
//               return Center(child: Text('Empty Data'));
//             }
//             return SafeArea(
//               child: Padding(
//                 padding: const EdgeInsets.all(16),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         const Text(
//                           'Pilih Pelajaran',
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 16,
//                           ),
//                         ),
//                         TextButton(onPressed: (){
//                           Get.toNamed(PagesRouteName.moreCourse);
//                         }, child: Text('Lihat Semua'))
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 8,
//                     ),
//                     ListView.separated(
//                       itemCount: _controller.courseData.value.length>3?3:_controller.courseData.value.length,
//                       shrinkWrap: true,
//                       itemBuilder: (context, index) {
//                         final data = _controller.courseData.value[index];
//                         return CourseCard(
//                             iconUrl: data.urlCover??'',
//                              courseName: data.courseName??'',
//                             jumlahDone: data.jumlahDone??0,
//                              jumlahMateri: data.jumlahMateri??0,
//                         );
//                       }, separatorBuilder: ( context,  index) =>
//                     const SizedBox(height: 8,),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           }
//           return Center(child: Text('Encaught Error '));
//         }
//       )
//
//     );
//   }
// }
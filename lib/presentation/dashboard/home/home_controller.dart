import 'package:elearning/data/model/banner_response.dart';
import 'package:elearning/data/model/user_response.dart';
import 'package:elearning/data/repository/banner_repository.dart';
import 'package:elearning/data/repository/course_repository.dart';
import 'package:elearning/data/services/firebase_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/values/urls.dart';
import '../../../data/model/course_response.dart';
import '../../../data/model/register_user_request.dart';
import '../../../data/repository/auth_repository.dart';
enum CourseDataStatus{ initial, loading,success,error}
class CourseDataStatusModel{
  final CourseDataStatus status;
  final String? detail;

  const CourseDataStatusModel({required this.status, this.detail});
}
class HomeController extends GetxController {
  final FirebaseAuthService firebaseAuthService;
  final CourseRepository courseRepository;
  final BannerRepository bannerRepository;
  final AuthRepository authRepository;

  HomeController(this.firebaseAuthService, this.courseRepository, this.bannerRepository, this.authRepository);

  @override
  void onInit() {
    super.onInit();
    getUser();
  }
  List<CourseData> courseList = [];
  bool isGetCoursesLoading = false;
  Rx<CourseDataStatusModel> courseDataStatus = Rx(const CourseDataStatusModel(status: CourseDataStatus.initial, ));

  // Currently set to static
  String majorName = 'IPA';
  int maxHomeCourseCount = 5;

  Future<void> getCourses() async {
    // Set Loading
    isGetCoursesLoading = true;
    courseDataStatus(const CourseDataStatusModel(status: CourseDataStatus.loading));
    update();
    String? email = firebaseAuthService.getCurrentSignedInUserEmail();
    if (email != null) {

      List<CourseData> result = await courseRepository.getCourses(
        majorName: majorName,
        email: email,
      );
      courseDataStatus(const CourseDataStatusModel(status: CourseDataStatus.success));
      isGetCoursesLoading = false;
      courseList = result;
      update();
    }
  }

  @override
  bool getUser(){
    //final FirebaseAuth _auth = FirebaseAuth.instance;

      // UserCredential result = _auth.currentUser?.email as UserCredential;
      // UserData user = result.user as UserData;
      //
      // await firebaseAuthService.isUserSignedIn();
      // return true;
      return FirebaseAuth.instance.currentUser == true;

  }
  // Future<void> getBanners(int? limit) async {
  //   // Set Loading
  //   isGetCoursesLoading = true;
  //   courseDataStatus(const CourseDataStatusModel(status: CourseDataStatus.loading));
  //   update();
  //
  //   try {
  //     Map<String, dynamic>? queryParams;
  //     if (limit != null) {
  //       queryParams = {"limit": limit};
  //     }
  //     final result = await bannerRepository.getBanners(Urls.banners, queryParameters: queryParams);
  //
  //     BannerResponse res = BannerResponse.fromJson(result);
  //     return res.data ?? [];
  //   } catch (e, stackTrace) {
  //     if (kDebugMode) {
  //       print('Err getBanners: $e, $stackTrace');
  //     }
  //     return [];
  //   }
  //     List<BannerData> result = await bannerRepository.getBanners(limit: q)
  //
  //     await BannerRepository(
  //       majorName: majorName,
  //       email: email,
  //     );
  //     courseDataStatus(const CourseDataStatusModel(status: CourseDataStatus.success));
  //     isGetCoursesLoading = false;
  //     courseList = result;
  //     update();
  // }
}

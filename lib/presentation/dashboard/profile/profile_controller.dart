import 'package:elearning/data/model/user_response.dart';
import 'package:elearning/presentation/dashboard/profile/profile_page.dart';
import 'package:elearning/presentation/dashboard/profile/profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../data/model/course_response.dart';
import '../../../data/services/firebase_auth_service.dart';
import '../../../routes/routes.dart';

class ProfileController extends GetxController {
  FirebaseAuthService firebaseAuthService;
  ProfileController({
    required this.firebaseAuthService,
  });

  late ProfilePageArgs args;
  @override
  void onInit(){
    args = Get.arguments  as ProfilePageArgs;

    Future.delayed(const Duration(milliseconds: 100)).then((value) async {
      await getProfile();
    });
    super.onInit();
  }
  List<UserData> userList = [];
  Future<void> getProfile() async {
    await firebaseAuthService.getCurrentSignedInUserEmail();

  }
  //String majorName = 'IPA';
  // List<CourseData> userList = [];
  // Future<void> getProfile()async {
  //   //await firebaseAuthService.getCurrentSignedInUserEmail();
  //   List<CourseData> result = (await firebaseAuthService.getCurrentSignedInUserEmail()) as List<CourseData>;
  //   userList = result;
  //   update();
  //
  // }
  Future<void> signOut() async {
    await firebaseAuthService.signOut();
    Get.offAllNamed(Routes.login);
  }
}

import 'package:elearning/core/values/urls.dart';
import 'package:elearning/data/model/user_response.dart';
import 'package:elearning/presentation/dashboard/profile/profile_page.dart';
import 'package:elearning/presentation/dashboard/profile/profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/model/course_response.dart';
import '../../../data/model/register_user_request.dart';
import '../../../data/repository/auth_repository.dart';
import '../../../data/services/firebase_auth_service.dart';
import '../../../routes/routes.dart';

class ProfileController extends GetxController {
  FirebaseAuthService firebaseAuthService;
  ProfileController({
    required this.firebaseAuthService,
  });

  @override
  void onInit(){
    super.onInit();

  }

  Future<void> signOut() async {
    await firebaseAuthService.signOut();
    Get.offAllNamed(Routes.login);
  }
}

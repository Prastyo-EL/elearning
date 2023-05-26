import 'dart:async';

import 'package:elearning/core/values/urls.dart';
import 'package:elearning/data/services/dio_client.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import '../../../core/values/page_route_name.dart';
import '../../../data/model/register_user_request.dart';
import '../../../data/model/user_response.dart';
import '../../../data/repository/auth_repository.dart';
import '../../../data/services/firebase_auth_service.dart';
import '../../../routes/routes.dart';
import 'package:elearning/data/services/dio_client.dart';

class RegistFormController extends GetxController {
  final FirebaseAuthService firebaseAuthService;
  final AuthRepository authRepository;


  RegistFormController(
      {required this.authRepository, required this.firebaseAuthService});

  late TextEditingController emailTextController;

  @override
  void onInit() {
    super.onInit();

    String email = firebaseAuthService.getCurrentSignedInUserEmail() ?? '';
    emailTextController = TextEditingController(text: email);
  }

  Future<void> registerUser({required UserBody user}) async {
    // TODO: Call AuthRepository.registerUser()
    final newuser =await authRepository.registerUser(userBody: user);
    if(newuser!=null){
      Get.offAllNamed(Routes.dashboard);
      Get.offNamed(emailTextController.text);
    }else{
      Get.offAllNamed(Routes.login);
    }
  }
}

import 'dart:io';

import 'package:elearning/presentation/routes/elearning_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elearning/routes/routes.dart';
import 'package:elearning/core/values/page_route_name.dart';

import 'core/values/colors.dart';
import 'routes/pages_binding.dart';
// import 'package:elearning/firebase_options.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:elearning/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  try {
    await Firebase.initializeApp();

    // if (result!=kIsWeb) {
    //   await DefaultFirebaseOptions.android;
    // }else{
    //   await DefaultFirebaseOptions.web;
    // }
  } catch (e, s) {
    print(s);
  }
  // Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    // (
    //   name: 'E Learning',
    //   options: DefaultFirebaseOptions.web,
    //   );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'E Learning',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 231, 231, 231),
        primaryColor: AppColors.primary,
        fontFamily: '',
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.primary,
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splash,
      getPages: Pages.pages,
      // getPages: GetLearningRoute.pages,
      // initialRoute: PagesRouteName.home,
    );
  }
}

/// To handle Error: HandshakeException: Handshake error in client (OS Error: CERTIFICATE_VERIFY_FAILED: certificate has expired(handshake.cc:393))
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

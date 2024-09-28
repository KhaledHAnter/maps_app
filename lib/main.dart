import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:phone_otp/core/routing/app_router.dart';
import 'package:phone_otp/doc_app.dart';
import 'package:phone_otp/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(PhoneOTP(
    appRouter: AppRouter(),
  ));
}

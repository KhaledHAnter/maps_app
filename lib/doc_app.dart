import 'package:flutter/material.dart';
import 'package:phone_otp/core/routing/app_router.dart';
import 'package:phone_otp/core/routing/routes.dart';
import 'package:phone_otp/core/theming/colors.dart';

class PhoneOTP extends StatelessWidget {
  final AppRouter appRouter;
  const PhoneOTP({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: LoginView(),
      debugShowCheckedModeBanner: false,
      title: "Doc Adavanced Flutter",
      theme: ThemeData(
        primaryColor: ColorsManager.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: Routes.registerView,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:phone_otp/core/routing/routes.dart';
import 'package:phone_otp/features/home/ui/views/register_view.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    // this arguments to be passed in any screen like this (arguments: arguments as ClassName)
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.registerView:
        return MaterialPageRoute(
          builder: (_) => RegisterView(),
        );

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text("No route defined for ${settings.name}"),
                  ),
                ));
    }
  }
}

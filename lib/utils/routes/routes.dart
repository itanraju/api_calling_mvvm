import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_atchi/utils/routes/routes_name.dart';
import 'package:mvvm_atchi/view/home_screen.dart';
import 'package:mvvm_atchi/view/login_view.dart';
import 'package:mvvm_atchi/view/signup_view.dart';
import 'package:mvvm_atchi/view/splash_view.dart';

class Routes{
  static Route<dynamic> generateRoutes(RouteSettings settings)
  {
    switch(settings.name){

      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context)=> HomeScreen());

      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context)=> LoginView());

      case RoutesName.signUp:
        return MaterialPageRoute(builder: (BuildContext context)=> SignUpView());

      case RoutesName.splash:
        return MaterialPageRoute(builder: (BuildContext context)=> SplashView());

      default:
        return MaterialPageRoute(builder: (_){
          return Scaffold(
            body: Center(
              child: Text("No Route Define"),
            ),
          );
        });
    }
  }
}
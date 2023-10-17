import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mvvm_atchi/model/user_model.dart';
import 'package:mvvm_atchi/utils/routes/routes_name.dart';
import 'package:mvvm_atchi/utils/utils.dart';
import 'package:mvvm_atchi/view_model/user_view_model.dart';
import 'package:provider/provider.dart';
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}


class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    super.initState();
    isUserLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: (){
            isUserLogin();
          },
            child: Text("Splash Screen")),
      ),
    );
  }

  void isUserLogin() async {
    final userViewModel=Provider.of<UserViewModel>(context,listen: false);
    UserModel userModel=await userViewModel.getUser();
    if(userModel.token.toString()=="null")
      {
        Timer(Duration(seconds: 3),
                ()=>Navigator.pushNamed(context, RoutesName.login
                )
            );
        //print("Token data is : "+userModel.token.toString());
        //Utils.toastMessage("Null");
      }
    else
      {
        Timer(Duration(seconds: 3),
                ()=>Navigator.pushNamed(context, RoutesName.home
            )
        );
        //print("Token data is : "+userModel.token.toString());
        //Utils.toastMessage("Not Null");
      }
  }
}

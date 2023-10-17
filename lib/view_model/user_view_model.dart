

import 'package:flutter/cupertino.dart';
import 'package:mvvm_atchi/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier{

  Future<void> saveUser(UserModel userModel) async {
    final SharedPreferences sp=await SharedPreferences.getInstance();
    sp.setString("token", userModel.token.toString());
    getUser();
  }

  Future<UserModel> getUser() async{
    final SharedPreferences sp=await SharedPreferences.getInstance();
    final String? token=sp.getString("token");
    notifyListeners();
    return UserModel(token: token.toString());
  }

  Future<bool> remove() async {
    final SharedPreferences sp= await SharedPreferences.getInstance();
    return sp.clear();
  }

}
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_atchi/model/user_model.dart';
import 'package:mvvm_atchi/repositary/auth_repository.dart';
import 'package:mvvm_atchi/utils/routes/routes_name.dart';
import 'package:mvvm_atchi/utils/utils.dart';
import 'package:mvvm_atchi/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier {

  final _myRepo= AuthRepository();

  bool _loading=false;
  bool get loading=> _loading;

  setLoading (bool value){
    _loading=value;
    notifyListeners();
  }

  bool _signUpLoading=false;
  bool get signUpLoading=> _signUpLoading;

  setSignUpLoading (bool value){
    _signUpLoading=value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data,BuildContext context) async{
      setLoading(true);
      _myRepo.loginApi(data).then((value){
        if(kDebugMode)
          {
            Navigator.pushNamed(context, RoutesName.home);
            Utils.flushBarErrorMessage("Login Successfully !", context);
            UserModel userModel=UserModel.fromJson(value);
            final userViewModel=Provider.of<UserViewModel>(context,listen: false);
            userViewModel.saveUser(userModel);
          }
        setLoading(false);
      }).onError((error, stackTrace){
        if(kDebugMode)
          {
            Utils.flushBarErrorMessage(error.toString(), context);
            print(error.toString());
          }
        setLoading(false);
      });}

  Future<void> signUpApi(dynamic data,BuildContext context) async{
    setSignUpLoading(true);
    _myRepo.signUpApi(data).then((value){
      if(kDebugMode)
      {
        Navigator.pushNamed(context, RoutesName.home);
        Utils.flushBarErrorMessage("Sign Successfully !", context);
        print(value.toString());
        UserModel userModel=UserModel.fromJson(value);
        final userViewModel=Provider.of<UserViewModel>(context,listen: false);
        userViewModel.saveUser(userModel);
      }
      setSignUpLoading(false);
    }).onError((error, stackTrace){
      if(kDebugMode)
      {
        Utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
      setSignUpLoading(false);
    });}

}
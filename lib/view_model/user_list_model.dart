
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_atchi/model/user_data_list_model.dart';
import 'package:mvvm_atchi/repositary/user_repository.dart';
import 'package:mvvm_atchi/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

import '../model/user_model.dart';
import '../utils/routes/routes_name.dart';
import '../utils/utils.dart';

class UserListModel with ChangeNotifier{
  final _userRepo=UserRepository();

  bool _loading=false;
  bool get loading=> _loading;

  List<Data> _userList=[];
  List<Data> get userList=> _userList;

  setLoading (bool value){
    _loading=value;
    notifyListeners();
  }

  Future<void> userListApi(BuildContext context) async{
    userList.clear();
    setLoading(true);
    _userRepo.userListApi().then((value){
      if(kDebugMode)
      {
        UserDataListModel userDataListModel=UserDataListModel.fromJson(value);
        for(int i=0;i<userDataListModel.data!.length;i++)
          {
            userList.add(userDataListModel.data![i]);
          }
        /*Utils.flushBarErrorMessage("Login Successfully !", context);
        UserModel userModel=UserModel.fromJson(value);
        final userViewModel=Provider.of<UserViewModel>(context,listen: false);
        userViewModel.saveUser(userModel);*/
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
}
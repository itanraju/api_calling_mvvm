import 'package:flutter/material.dart';
import 'package:mvvm_atchi/res/color.dart';
import 'package:mvvm_atchi/view_model/user_list_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserListModel>(builder: (context,userModelList,child){
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Text("Home Screen",style: TextStyle(color: AppColors.whiteColor)),
            actions: [
              IconButton(
                  onPressed: (){
                    userModelList.userListApi(context);
                  },
                  icon: Icon(Icons.ads_click,color: AppColors.whiteColor))
            ],
          ),
          backgroundColor: AppColors.whiteColor,
          body: Center(
              child: userModelList.loading?CircularProgressIndicator():
              ListView.builder(
                  itemCount: userModelList.userList.length,
                  itemBuilder: (BuildContext context, int index){
                    return ListTile(
                        leading: const Icon(Icons.people),
                        subtitle: Text(userModelList.userList[index].email.toString()),
                        trailing: ElevatedButton(
                            onPressed: () {

                            },
                            child: Icon(Icons.delete)),
                        title: Text(userModelList.userList[index].firstName.toString()+"  "+userModelList.userList[index].lastName.toString())
                    );
                  })
          )
      );
    });
  }
}

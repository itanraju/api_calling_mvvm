import 'package:flutter/material.dart';
import 'package:mvvm_atchi/res/components/round_button.dart';
import 'package:mvvm_atchi/utils/routes/routes_name.dart';
import 'package:mvvm_atchi/utils/utils.dart';
import 'package:mvvm_atchi/view/home_screen.dart';
import 'package:mvvm_atchi/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  ValueNotifier<bool> _obsecuredPassword=ValueNotifier<bool>(true);
  TextEditingController _emailController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();
  FocusNode emailFocusNode=FocusNode();
  FocusNode passwordFocusNode=FocusNode();
  @override
  Widget build(BuildContext context) {
    final authViewModel=Provider.of<AuthViewModel>(context);
    final height=MediaQuery.of(context).size.height*1;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
          title: Text("Login",style: TextStyle(color: Colors.white),),
      centerTitle: true,),
      body: SafeArea(
        child: Column(
          mainAxisAlignment:  MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              focusNode: emailFocusNode,
              decoration: InputDecoration(
                labelText: "Email",
                hintText: "Email",
                prefixIcon: Icon(Icons.alternate_email)
              ),
              onFieldSubmitted: (value){
                Utils.fieldFocusChange(context, emailFocusNode, passwordFocusNode);
              },
            ),
            ValueListenableBuilder(
              valueListenable: _obsecuredPassword,
              builder: (context,value,child){
                return TextFormField(
                  controller: _passwordController,
                  obscureText: _obsecuredPassword.value,
                  focusNode: passwordFocusNode,
                  decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "Password",
                      prefixIcon: Icon(Icons.lock_clock_outlined),
                      suffixIcon: InkWell(
                        onTap: (){
                          _obsecuredPassword.value=!_obsecuredPassword.value;
                        },
                        child:_obsecuredPassword.value?Icon(Icons.visibility_off_outlined):Icon(Icons.visibility))
                  ),
                );
              },
            ),
            SizedBox(height: height*.1,),
            RoundButton(
                title: "Login",
                loading: authViewModel.loading,
                onPress: (){
              if(_emailController.text.isEmpty)
                {
                    Utils.flushBarErrorMessage("Please enter email", context);
                }
              else if(_passwordController.text.isEmpty)
                {
                  Utils.flushBarErrorMessage("Please enter password", context);
                }
              else if(_passwordController.text.length<6)
                {
                  Utils.flushBarErrorMessage("Please enter 6 digit password", context);
                }
              else
                {
                  Map data={
                    "email": _emailController.text.toString(),
                    "password":_passwordController.text.toString()
                  };
                  authViewModel.loginApi(data,context);
                  print("Map Data"+data.toString());
                }
            }),
            SizedBox(height: 30),
            InkWell(
              onTap: (){
                  Navigator.pushNamed(context, RoutesName.signUp);
              },
              child: Text("Don't have an account ? Sign up"),
            )
          ],
        ),
      ),
    );
  }
}

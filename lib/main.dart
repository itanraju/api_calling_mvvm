import 'package:flutter/material.dart';
import 'package:mvvm_atchi/utils/routes/routes.dart';
import 'package:mvvm_atchi/utils/routes/routes_name.dart';
import 'package:mvvm_atchi/view/login_view.dart';
import 'package:mvvm_atchi/view_model/auth_view_model.dart';
import 'package:mvvm_atchi/view_model/user_list_model.dart';
import 'package:mvvm_atchi/view_model/user_view_model.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>AuthViewModel()),
        ChangeNotifierProvider(create: (_)=>UserViewModel()),
        ChangeNotifierProvider(create: (_)=>UserListModel())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: RoutesName.splash,
        onGenerateRoute: Routes.generateRoutes,
      ),
    );
  }
}

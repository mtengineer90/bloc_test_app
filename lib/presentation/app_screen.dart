import 'package:bloc_test_app/blocs/add_user_bloc/add_user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/get_user_bloc/get_user_bloc.dart';
import '../blocs/get_user_bloc/get_user_event.dart';
import '../repositories/user_service.dart';


class App extends StatelessWidget {
  const App({Key? key, required this.userService}) : super(key: key);

  final UserService userService;

  @override
  Widget build(BuildContext context) {

    return RepositoryProvider.value(
      value: userService,
      child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) =>  GetUserBloc(userService: userService)..add(GetUser()),
            ),
            BlocProvider(
              create: (_) =>  AddNewUserBloc(userService: userService),
            ),
            BlocProvider(
              create: (_) =>  UpdateUserBloc(userService: UserService),
            ),
            BlocProvider(
              create: (_) =>  DeleteUserBloc(userService: UserService),
            ),
          ],
          child: const AppView()),
    );
  }
}


class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      home: const HomePage(),
    );
  }
}
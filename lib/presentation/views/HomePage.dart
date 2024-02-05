import 'package:bloc_test_app/blocs/get_user_bloc/get_user_bloc.dart';
import 'package:bloc_test_app/blocs/get_user_bloc/get_user_state.dart';
import 'package:bloc_test_app/widgets/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideDrawer(),
      appBar: AppBar(
        title: const Text("Get User")
      ),
      body: const SafeArea(child: ProfilePage()),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserBloc, GetUserState>(
        builder: (context, state) {
          switch (state){
            case GetUserLoading() :
              return const Center(child: CircularProgressIndicator());
            case GetUserLoaded() :
              return Center(
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network("${state.user.avatar}")
                    ),
                    Text('${state.user.firstName} ${state.user.lastName}',
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                    )
                  ],
                )
              );
            case GetUserError() :
              return const Text('Get User Error');
          }
        }
    );
  }
}


import 'package:bloc_test_app/blocs/add_user_bloc/add_user_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/add_user_bloc/add_user_event.dart';
import '../../blocs/add_user_bloc/add_user_state.dart';

class AddUserPageBody extends StatelessWidget {
  AddUserPageBody({Key? key}) : super(key: key);

  final TextEditingController name = TextEditingController();
  final TextEditingController job = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: BlocBuilder<AddNewUserBloc, AddNewUserState>(
            builder: (context, state) {
              return Column(
                children: [
                  const Text(
                    "POST",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    decoration: const InputDecoration(hintText: 'Enter name'),
                    controller: name,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    decoration: const InputDecoration(hintText: 'Enter job'),
                    controller: job,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    onPressed: () {
                      context
                          .read<AddNewUserBloc>()
                          .add(AddNewUser(name.text, job.text));
                      if (context.mounted) {
                        showDialog(
                            context: context,
                            builder: (context) => NewUserDialog(
                                  state: state,
                                ));
                      }
                    },
                    child: state is AddNewUserLoaded? ||
                            state is AddNewUserInitial
                        ? const Text(
                            "Create User",
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          )
                        : const CircularProgressIndicator(),
                  )
                ],
              );
            },
          )),
    );
  }
}

class NewUserDialog extends StatelessWidget {
  const NewUserDialog({super.key, required this.state});

  final AddNewUserState state;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddNewUserBloc, AddNewUserState>(
        builder: (context, state) {
      switch (state) {
        case AddNewUserLoaded():
          return Dialog(
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'ID: ${state.newUser.id}',
                            ),
                            Text('Name: ${state.newUser.name}'),
                            Text('Job: ${state.newUser.job}'),
                            Text(
                              'Created at: ${state.newUser.createdAt}',
                            )
                          ]))));
        case AddNewUserLoading():
          return Container();
      }
      return const Text('Something went wrong');
    });
  }
}
